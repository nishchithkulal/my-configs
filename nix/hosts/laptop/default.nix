{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/laptop-only/openmpi.nix
  ];

  networking.hostName = "laptop";
}
