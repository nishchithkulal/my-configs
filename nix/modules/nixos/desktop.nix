{ pkgs, ... }:
{
  # Compositor
  programs.niri.enable = true;          # niri + niri-session, portals, polkit, keyring
  hardware.graphics.enable = true;      # Mesa / OpenGL / Vulkan

  # Login screen
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
      user = "greeter";
    };
  };

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
