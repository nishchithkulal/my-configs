{ ... }:
{
  programs.zoxide = {
    enable = true;              #smarter cd
    options = [ "--cmd cd" ];   # zoxide becomes `cd` itself
  };
}
