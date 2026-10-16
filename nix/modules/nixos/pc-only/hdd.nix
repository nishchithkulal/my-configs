{ ... }:
{
  fileSystems."/home/chaotic_nylo/HDD" = {
    device = "/dev/disk/by-uuid/41794fd1-bf58-4dce-863e-5bed26ffd93c";
    fsType = "btrfs";
    options = [
      "noatime"                       # don't write on every file read (faster, less wear)
      "compress=zstd"                 # compress new files transparently
      "nofail"                        # PC still boots if the HDD is missing or broken
      "x-systemd.device-timeout=10s"  # ...and waits max 10 s for it
    ];
  };

  # Monthly integrity check (finds silent disk errors early)
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/home/chaotic_nylo/HDD" ];
  };
}
