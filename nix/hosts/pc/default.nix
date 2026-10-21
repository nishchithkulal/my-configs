{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/pc-only/nvidia.nix
    ../../modules/nixos/pc-only/obs.nix
    ../../modules/nixos/pc-only/hdd.nix
    ../../modules/nixos/pc-only/jack-retask.nix
    ../../modules/nixos/pc-only/minecraft.nix
    ../../modules/nixos/pc-only/games.nix
  ];

  networking.hostName = "pc";
}
