{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openmpi
  ];
}
