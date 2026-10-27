{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openmpi
    openmpi.dev
  ];
}
