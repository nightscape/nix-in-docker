#!/bin/bash

set -e

addgroup -S nixbld

for i in $(seq 1 $NUM_NIXBUILDERS); do
  adduser -DH nix$i
  addgroup nix$i nixbld
done
mkdir -m 0755 /nix
chgrp -R nixbld /nix
curl https://nixos.org/nix/install | sh
echo ". /root/.nix-profile/etc/profile.d/nix.sh" >> /root/.profile
