{ pkgs, ... }:
{
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
