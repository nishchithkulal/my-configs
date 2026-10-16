{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos";
      update  = "nix flake update --flake ~/nixos && sudo nixos-rebuild switch --flake ~/nixos";
    };
  };

  home.sessionVariables.EDITOR = "vim";

  programs.git = {
    enable = true;
    settings.user = {
      name = "Nishchith Kulal";
      email = "nishchithkulal.22@gmail.com";
    };
  };
}
