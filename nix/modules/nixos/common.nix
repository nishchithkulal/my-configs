{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./users.nix
    ./networking.nix
    ./audio.nix
    ./fonts.nix
    ./niri.nix
    ./noctalia.nix
    ./secrets.nix
    ./bluetooth.nix
    ./media.nix
    ./dev.nix
    ./greeter.nix
    ./gaming.nix
    ./theme.nix
    ./libreoffice.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;      # deduplicates identical files in /nix/store
  };

  nix.gc = {                         # weekly cleanup of old generations
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  hardware.graphics.enable = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [ vim git wget curl ];

  system.stateVersion = "26.05";     # never change
}
