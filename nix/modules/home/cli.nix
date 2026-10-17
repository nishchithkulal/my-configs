{ ... }:
{
  programs.zoxide = {
    enable = true;              #smarter cd
    options = [ "--cmd cd" ];   # zoxide becomes `cd` itself
  };
  programs.mise.enable = true;     # per-project tool versions (node, python, …)
}
