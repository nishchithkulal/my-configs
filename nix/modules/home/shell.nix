{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      update  = "nix flake update --flake /etc/nixos && sudo nixos-rebuild switch";
    }; 
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Nishchith Kulal";
      email = "nishchithkulal.22@gmail.com";
    };
  };
}
