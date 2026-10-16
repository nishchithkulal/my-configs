#!/usr/bin/env bash
set -e
cd ~/my-configs/nix
sudo SOPS_AGE_KEY_CMD="ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key" \
  "$(command -v sops)" updatekeys -y secrets/secrets.yaml
