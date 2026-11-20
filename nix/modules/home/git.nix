

{ ... }:
{
  programs.git = {
    enable = true;

    settings.user = {
      name = "Nishchith Kulal";
      email = "nishchithkulal.22@gmail.com";
    };
  };

  # GitHub SSH configuration
  programs.ssh = {
    enable = true;

    matchBlocks."github.com" = {
      hostname = "ssh.github.com";
      user = "git";
      port = 443;

      identityFile = "~/.ssh/id_ed25519";
      identitiesOnly = true;
    };
  };
}
