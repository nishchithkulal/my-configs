{ pkgs, ... }:

let
  curseforge = pkgs.writeShellScriptBin "curseforge" ''
    APPIMAGE="$HOME/CurseForge/curseforge-latest-linux.AppImage"

    if [ ! -f "$APPIMAGE" ]; then
      echo "CurseForge AppImage not found: $APPIMAGE"
      exit 1
    fi

    chmod +x "$APPIMAGE"
    exec "$APPIMAGE" --no-sandbox "$@"
  '';
in
{
  home.packages = [
    curseforge
  ];
}
