{ ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;          # realtime priority, avoids crackling

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;            # 32-bit games (Steam/Wine)
    pulse.enable = true;                 # apps that expect PulseAudio
    jack.enable = true;                  # JACK apps, useful for streaming
  };
}
