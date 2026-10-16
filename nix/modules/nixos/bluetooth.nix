{ ... }:
{
  hardware.enableRedistributableFirmware = true;  # firmware blobs for BT/Wi-Fi/GPU

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;            # adapter on after boot
    settings.General = {
      Experimental = true;         # shows headphone battery level
      FastConnectable = true;      # quicker reconnect for headphones/controllers
    };
  };
}
