{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override { 
      cudaSupport = true; 
      browserSupport = true;
    };  # NVENC encoding
    enableVirtualCamera = true;       # OBS as a webcam in Discord/Meet
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture      # capture audio per app (game only, no Discord)
      obs-vkcapture                   # low-overhead Vulkan/OpenGL game capture
    ];
  };
} 
