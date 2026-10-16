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
    eza
    zoxide
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
