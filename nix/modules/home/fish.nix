{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting    # no "Welcome to fish" message
    '';
  };
}
