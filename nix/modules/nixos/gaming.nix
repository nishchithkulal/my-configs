{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;              # Steam Remote Play / Link
    extraCompatPackages = [ pkgs.proton-ge-bin ]; # Proton-GE in Steam's compatibility menu
  };

  programs.gamemode.enable = true;    # CPU/GPU performance boost while a game runs
  programs.gamescope.enable = true;   # Valve's game compositor (fixes fullscreen/scaling)

  environment.systemPackages = with pkgs; [
    lutris
    heroic
    steam-run        # runs non-Nix Linux binaries (SKLauncher, random game tarballs)
    jdk21            # Java for SKLauncher / Minecraft
  ];
}
