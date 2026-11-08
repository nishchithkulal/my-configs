{ pkgs, ... }:

let
  sklauncher = pkgs.writeShellScriptBin "sklauncher" ''
    exec ${pkgs.appimage-run}/bin/appimage-run \
      "$HOME/Games/SKlauncher-4.0.57-x86_64.AppImage" "$@"
  '';

  sklauncherDesktop = pkgs.makeDesktopItem {
    name = "sklauncher";
    desktopName = "SKlauncher";
    comment = "Minecraft Launcher";
    exec = "${sklauncher}/bin/sklauncher";
    icon = "applications-games";
    categories = [ "Game" ];
  };

in
{
  environment.systemPackages = [
    pkgs.appimage-run
    sklauncher
    sklauncherDesktop
  ];
}
