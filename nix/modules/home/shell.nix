{ ... }:
{
  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting    # no "Welcome to fish" message
    '';
  };

  # Aliases for ALL shells (not just bash)
  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
    update  = "nix flake update --flake /etc/nixos && sudo nixos-rebuild switch";
    lg = "lazygit";
    ls = "eza -l";
    cd = "z";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Nishchith Kulal";
      email = "nishchithkulal.22@gmail.com";
    };
  };
}
