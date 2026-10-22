{ ... }:
{
  # Aliases for ALL shells (not just bash)
  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
    update  = "nix flake update --flake /etc/nixos && sudo nixos-rebuild switch";
    lg = "lazygit";
    ls = "eza -l";
    cat = "bat";
    niri-validate = "niri validate --config ~/my-configs/nix/dotfiles/niri/config.kdl"
  };
}
