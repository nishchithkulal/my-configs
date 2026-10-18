{ ... }:
{
  networking.networkmanager = {
    enable = true;
    insertNameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  networking.enableIPv6 = false;
}
