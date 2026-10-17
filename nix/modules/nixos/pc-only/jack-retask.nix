{ pkgs, ... }:
let
  card    = "alsa_card.pci-0000_30_00.6";                  # Realtek ALC897
  sink    = "alsa_output.pci-0000_30_00.6.analog-stereo";
  profile = "output:analog-stereo+input:analog-stereo";
  port    = "analog-output-headphones";
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

  # 2. WirePlumber rules for the Realtek card
  services.pipewire.wireplumber.extraConfig."50-realtek" = {
    "monitor.alsa.rules" = [
      {
        # Card: always on, never switched by jack detection
        matches = [ { "device.name" = card; } ];
        actions.update-props = {
          "device.profile" = profile;
          "api.acp.auto-profile" = false;
          "api.acp.auto-port" = false;
        };
      }
      {
        # Output: highest priority → default
        matches = [ { "node.name" = sink; } ];
        actions.update-props = {
          "priority.session" = 2000;
          "priority.driver" = 2000;
        };
      }
    ];
  };

  # 3. At login: profile on, Realtek default, Headphones port
  systemd.user.services.realtek-headphones = {
    description = "Set Realtek output to Headphones";
    after = [ "wireplumber.service" ];
    wantedBy = [ "default.target" ];
    path = with pkgs; [ pulseaudio gnugrep coreutils ];
    serviceConfig.Type = "oneshot";
    script = ''
      # wait for the card (max 10 s)
      for i in $(seq 20); do
        pactl list short cards | grep -q "${card}" && break
        sleep 0.5
      done
      pactl set-card-profile ${card} ${profile}

      # wait for its output (max 10 s)
      for i in $(seq 20); do
        pactl list short sinks | grep -q "${sink}" && break
        sleep 0.5
      done
      pactl set-default-sink ${sink}
      pactl set-sink-port ${sink} ${port}
    '';
  };
}
