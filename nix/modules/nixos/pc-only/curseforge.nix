
{ pkgs, ... }:

let
  curseforge = pkgs.writeShellScriptBin "curseforge" ''
    APPIMAGE="$HOME/Games/curseforge-latest-linux.AppImage"

    if [ ! -f "$APPIMAGE" ]; then
      echo "CurseForge AppImage not found: $APPIMAGE"
      exit 1
    fi

    chmod +x "$APPIMAGE"
    exec "$APPIMAGE" "$@"
  '';
in
{
  environment.systemPackages = [
    curseforge
  ];
}

