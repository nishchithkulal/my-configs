{ pkgs, ... }:
let
  sink = "alsa_output.pci-0000_30_00.6.analog-stereo";   # Realtek ALC897
in
{
  # 1. Pin retask: loaded by the sound driver at boot
  hardware.firmware = [
    (pkgs.writeTextDir "lib/firmware/hda-jack-retask.fw"
      (builtins.readFile ../../../hosts/pc/hda-jack-retask.fw))
  ];
  boot.extraModprobeConfig = ''
    options snd-hda-intel patch=hda-jack-retask.fw,hda-jack-retask.fw,hda-jack-retask.fw,hda-jack-retask.fw
  '';

  # 2. Default output: Realtek gets the highest priority in WirePlumber
  services.pipewire.wireplumber.extraConfig."50-realtek-default" = {
    "monitor.alsa.rules" = [
      {
        matches = [ { "node.name" = sink; } ];
        actions.update-props = {
          "priority.session" = 2000;   # HDMI/USB outputs are ~1000 or lower
          "priority.driver" = 2000;
        };
      }
    ];
  };

  # 3. Port: Realtek → Headphones at every login
  systemd.user.services.realtek-headphones = {
    description = "Set Realtek output to Headphones";
    after = [ "wireplumber.service" ];
    wantedBy = [ "default.target" ];
    path = with pkgs; [ pulseaudio gnugrep coreutils ];
    serviceConfig.Type = "oneshot";
    script = ''
      for i in $(seq 20); do
        pactl list short sinks | grep -q "${sink}" && break
        sleep 0.5
      done
      pactl set-default-sink ${sink}
      pactl set-sink-port ${sink} analog-output-headphones
    '';
  };
}
