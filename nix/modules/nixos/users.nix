  { pkgs, ... }:
  {
    programs.fish.enable = true;        # registers fish as a valid login shell
    users.users.chaotic_nylo = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" ];
      shell = pkgs.fish;
    };
  }
