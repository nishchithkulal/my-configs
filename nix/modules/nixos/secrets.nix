{ inputs, pkgs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  # SSH server: creates /etc/ssh/ssh_host_ed25519_key (the machine's unlock key)
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  environment.systemPackages = with pkgs; [ sops ssh-to-age ];

  # Edit secrets with this machine's host key: `sops-edit secrets/secrets.yaml`
  environment.shellAliases.sops-edit =
    "sudo SOPS_AGE_KEY_CMD='${pkgs.ssh-to-age}/bin/ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key' ${pkgs.sops}/bin/sops";

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets.ssh_key = {
      owner = "chaotic_nylo";
      mode = "0600";
      path = "/home/chaotic_nylo/.ssh/id_ed25519";
    };
  };

  # make sure ~/.ssh exists and belongs to you (fresh laptop installs)
  systemd.tmpfiles.rules = [ "d /home/chaotic_nylo/.ssh 0700 chaotic_nylo users -" ];
}
