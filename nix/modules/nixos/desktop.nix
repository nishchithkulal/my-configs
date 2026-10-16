{ pkgs, ... }:
{
  # Compositor
  programs.niri = {
    enable = true;

    # niri-session with the non-deprecated import-environment
    # (explicit variable list instead of "import everything" with no args)
    package = pkgs.symlinkJoin {
      name = "niri-fixed-session";
      paths = [ pkgs.niri ];
      inherit (pkgs.niri) passthru meta;
      postBuild = ''
        rm $out/bin/niri-session
        sed "s#systemctl --user import-environment\$#systemctl --user import-environment \$(awk 'BEGIN{for(v in ENVIRON) print v}' | grep -E '^[A-Za-z_][A-Za-z0-9_]*\$')#" \
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
