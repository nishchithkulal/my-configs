{ pkgs, ... }:
{
  home.packages = [ pkgs.kitty ];
  xdg.configFile."kitty".source = ../../dotfiles/kitty;
}
