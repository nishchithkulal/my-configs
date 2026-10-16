{ config, ... }:
let
  cursor = config.my.theme.cursor;
in
{
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = [ "chaotic_nylo" ];

    settings = {
      keyboard.layout = "us";
      cursor.size = cursor.size;
    };

    cursorTheme = {
      inherit (cursor) package name;
    };
  };
}
