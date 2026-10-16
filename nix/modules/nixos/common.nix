{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./users.nix
    ./networking.nix
    ./audio.nix
    ./desktop.nix
    ./fonts.nix
    ./secrets.nix
    ./bluetooth.nix
    ./media.nix
    ./dev.nix
    ./greeter.nix
    ./gaming.nix
    ./theme.nix
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

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [ vim git wget curl ];

  system.stateVersion = "26.05";     # never change
}
