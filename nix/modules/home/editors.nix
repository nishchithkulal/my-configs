{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    zed-editor
  ];

  home.sessionVariables = {
    EDITOR = "nvim";         # git commits, crontab, etc.
    VISUAL = "nvim";
    SUDO_EDITOR = "vim";     # used by `sudoedit file` / `sudo -e file`
  };
}
