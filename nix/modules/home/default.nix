{ ... }:
{
  imports = [
    ./niri.nix
    ./kitty.nix
    ./shell.nix
    ./apps.nix
    ./editors.nix
    ./nvim.nix
    ./cli.nix
    ./mouse-cursor.nix
    ./ghostty.nix
    ./git.nix
  ];

  home.username = "chaotic_nylo";
  home.homeDirectory = "/home/chaotic_nylo";
  home.stateVersion = "26.05";      # never change
}
