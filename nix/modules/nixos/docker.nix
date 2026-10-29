{ config, lib, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;

    # Start Docker at boot.
    enableOnBoot = true;
  };

  # Install the Docker CLI and Compose plugin.
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
}
