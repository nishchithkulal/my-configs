{ pkgs, ... }:
{
  # Compositor
  programs.niri = {
    enable = true;

    # Same niri, but niri-session no longer prints systemd's
    # "import-environment without a list ... is deprecated" notice.
    package = pkgs.symlinkJoin {
      name = "niri-quiet-session";
      paths = [ pkgs.niri ];
      inherit (pkgs.niri) passthru meta;
      postBuild = ''
        rm $out/bin/niri-session
        sed 's|systemctl --user import-environment$|& 2>/dev/null|' \
          ${pkgs.niri}/bin/niri-session > $out/bin/niri-session
        chmod +x $out/bin/niri-session
      '';
    };
  };

  hardware.graphics.enable = true;      # Mesa / OpenGL / Vulkan

   # Services Noctalia's widgets read from
  services.upower.enable = true;                 # battery
  services.power-profiles-daemon.enable = true;  # power profile switcher

  environment.sessionVariables.NIXOS_OZONE_WL = "1";  # Electron apps run native Wayland

  environment.systemPackages = with pkgs; [
    noctalia               # the shell/bar
    xwayland-satellite     # X11 apps (Steam etc.); niri starts it automatically
    wl-clipboard
    wl-mirror              # projector mirroring
    brightnessctl
  ];
}
