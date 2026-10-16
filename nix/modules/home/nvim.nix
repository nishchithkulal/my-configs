{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim

    # LazyVim requirements
    lazygit          # <leader>gg
    fzf              # fzf-lua picker
    ripgrep          # grep / live search
    fd               # file finder
    tree-sitter      # parser compiler (needed by newer nvim-treesitter)
    gcc
    gnumake
    unzip
    curl
    wget

    # runtimes Mason uses to install tools
    nodejs
    python3

    # Nix tooling (Mason doesn't provide these)
    nil
    nixfmt
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/my-configs/nix/dotfiles/nvim";
}
