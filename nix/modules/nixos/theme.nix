{ lib, pkgs, ... }:
{
  options.my.theme.cursor = {
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.bibata-cursors;
      description = "Cursor theme package (greeter, desktop, niri).";
    };
    name = lib.mkOption {
      type = lib.types.str;
      default = "Bibata-Modern-Ice";
      description = "Cursor theme name.";
    };
    size = lib.mkOption {
      type = lib.types.ints.positive;
      default = 24;
      description = "Cursor size in pixels.";
    };
  };
}
