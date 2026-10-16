{ ... }:
{
  users.users.chaotic_nylo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };
}
