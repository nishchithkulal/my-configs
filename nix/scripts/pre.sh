#!/usr/bin/env bash
set -e
sudo ssh-keygen -A
nix-shell -p ssh-to-age --run 'ssh-to-age < /etc/ssh/ssh_host_ed25519_key.pub'
