{ pkgs, ... }:

let
  sklauncher = pkgs.writeShellScriptBin "sklauncher" ''
    shopt -s nullglob

    versions=( "$HOME"/Games/SKlauncher-*-x86_64.AppImage )

    if [ ''${#versions[@]} -eq 0 ]; then
      echo "Error: SKlauncher AppImage not found in ~/Games"
      exit 1
    fi

    # Select the latest version number
    appimage=$(
      printf '%s\n' "''${versions[@]}" |
      sort -V |
      tail -n 1
    )

    exec ${pkgs.appimage-run}/bin/appimage-run "$appimage" "$@"
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

