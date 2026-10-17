{ pkgs, ... }:
let
  # `sklauncher` command: runs SKlauncher inside steam-run (needs /usr/lib for GTK/OpenGL)
  sklauncher = pkgs.writeShellScriptBin "sklauncher" ''
    exec ${pkgs.steam-run}/bin/steam-run ${pkgs.jdk21}/bin/java -jar "$HOME/Games/SKlauncher.jar" "$@"
  '';

  # App launcher entry
  sklauncherDesktop = pkgs.makeDesktopItem {
    name = "sklauncher";
    desktopName = "SKlauncher";
    comment = "Minecraft launcher";
    exec = "${sklauncher}/bin/sklauncher";
    icon = "applications-games";
    categories = [ "Game" ];
  };
in
{
  environment.systemPackages = [
    pkgs.jdk21          # Java for Minecraft
    sklauncher
    sklauncherDesktop
  ];
}
