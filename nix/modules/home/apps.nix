{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    btop
    fastfetch
    ripgrep
    fd
    unzip
    brave-origin
    bat
    eza
  ];
  }
