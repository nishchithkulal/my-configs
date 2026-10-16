{ osConfig, ... }:
let
  cursor = osConfig.my.theme.cursor;
in
{
  # GTK, XWayland and everything else
  home.pointerCursor = {
    inherit (cursor) package name size;
    gtk.enable = true;
    x11.enable = true;
  };

  # niri's own cursor, generated from the same values
  xdg.configFile."niri-nix/cursor.kdl".text = ''
    cursor {
        xcursor-theme "${cursor.name}"
        xcursor-size ${toString cursor.size}
    }
  '';
}
