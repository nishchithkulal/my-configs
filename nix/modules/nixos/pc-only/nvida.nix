{ config, pkgs, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];   # loads the driver (needed on Wayland too)

  hardware.nvidia = {
    open = false;                                  # proprietary kernel module
    modesetting.enable = true;                     # required for Wayland/niri
    powerManagement.enable = true;                 # saves VRAM on suspend → clean resume
    nvidiaSettings = true;                         # nvidia-settings GUI
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Hardware video decode in browsers/mpv
  hardware.graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  # niri wiki fix: stops niri using ~1 GB of VRAM on NVIDIA
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text =
    builtins.toJSON {
      rules = [{
        pattern = { feature = "procname"; matches = "niri"; };
        profile = "Limit Free Buffer Pool On Wayland Compositors";
      }];
      profiles = [{
        name = "Limit Free Buffer Pool On Wayland Compositors";
        settings = [{ key = "GLVidHeapReuseRatio"; value = 0; }];
      }];
    };

  environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];  # GPU monitor

  # If a rebuild fails because the driver doesn't support the newest kernel yet:
  # boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
