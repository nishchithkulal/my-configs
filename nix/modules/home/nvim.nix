{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim

    # needed by plugins (lazy.nvim, treesitter, telescope)
    git
    gcc
    gnumake
    unzip
    ripgrep
    fd
    nodejs
    tree-sitter

    # language servers / formatters (installed by Nix, not Mason)
    lua-language-server
    stylua
    nil              # Nix LSP
    nixfmt
  ];

  # ~/.config/nvim → your repo folder, editable live (no rebuild needed)
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/my-configs/nix/dotfiles/nvim";
}
