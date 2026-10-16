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
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
  
  programs.mise = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.zsh.enable = true;
  programs.fish.enable = true;

}
