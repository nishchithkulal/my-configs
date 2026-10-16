{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common.nix

    # PC-only, enabled tomorrow:
    # ../../modules/nixos/pc-only/nvidia.nix
    # ../../modules/nixos/pc-only/streaming.nix
    # ../../modules/nixos/pc-only/jack-retask.nix
  ];

  networking.hostName = "pc";
}
