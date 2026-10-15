{ config, pkgs, ...}:

{
    home.username = "chaotic_nylo";
    home.homeDirectory = "/home/chaotic_nylo";
    programs.git.enable = true;
    home.stateVersion = "26.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo I use NixOS btw";
            lg = "lazygit";
        };
    };
}
