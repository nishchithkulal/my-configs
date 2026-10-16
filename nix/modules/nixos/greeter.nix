{ pkgs, ... }:
{
  services.displayManager.noctalia-greeter = {
    enable = true;

    # Noctalia Settings → Sync Now works without a password prompt for you
    passwordlessSyncUsers = [ "chaotic_nylo" ];

    settings.keyboard.layout = "us";

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
}
