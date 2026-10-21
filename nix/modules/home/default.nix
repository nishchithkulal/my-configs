{ ... }:
{
  imports = [
    ./niri.nix
    ./kitty.nix
    ./shell-aliases.nix
    ./apps.nix
    ./editors.nix
    ./nvim.nix
    ./mouse-cursor.nix
    ./mise.nix
    ./zoxide.nix
    ./ghostty.nix
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./fish.nix
  ];

  home.username = "chaotic_nylo";
  home.homeDirectory = "/home/chaotic_nylo";
  home.stateVersion = "26.05";      # never change
}
