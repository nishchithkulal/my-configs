{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono     # icons for bar/terminal
  ];

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
}
