{ pkgs, ... }:
{
  # Compositor
  programs.niri = {
    enable = true;

    # niri-session with the non-deprecated import-environment
    # (explicit variable list; skips gawk's own AWKPATH/AWKLIBPATH)
    package = pkgs.symlinkJoin {
      name = "niri-fixed-session";
      paths = [ pkgs.niri ];
      inherit (pkgs.niri) passthru meta;
      postBuild = ''
        rm $out/bin/niri-session
        sed "s#systemctl --user import-environment\$#systemctl --user import-environment \$(awk 'BEGIN{for(v in ENVIRON) if (v != \"AWKPATH\" \&\& v != \"AWKLIBPATH\") print v}' | grep -E '^[A-Za-z_][A-Za-z0-9_]*\$')#" \
          ${pkgs.niri}/bin/niri-session > $out/bin/niri-session
        chmod +x $out/bin/niri-session
      '';
    };
  };

  hardware.graphics.enable = true;

  # Login screen → see greeter.nix

  # Services Noctalia's widgets read from
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";                    # Electron apps: native Wayland
    SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR = "0";  # SDL apps/games (Minecraft): no self-drawn title bar
  };

  environment.systemPackages = with pkgs; [
    noctalia
    xwayland-satellite
    wl-clipboard
    wl-mirror
    brightnessctl
    nautilus
  ];
}
