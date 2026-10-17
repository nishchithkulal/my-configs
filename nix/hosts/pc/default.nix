{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/pc-only/nvidia.nix
    ../../modules/nixos/pc-only/streaming.nix
    ../../modules/nixos/pc-only/hdd.nix
    ../../modules/nixos/pc-only/jack-retask.nix
    ../../modules/nixos/pc-only/minecraft.nix
  ];

  networking.hostName = "pc";
}
