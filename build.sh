#!/bin/bash
# This file is executed INSIDE the alarm container
# The container might be a little bit out-of-date, so
# always update it first
pacman -Syu

# Create builder user matching the UID outside
useradd -u $OUTSIDE_UID builder
# Allow nopasswd sudo
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cd /mnt/src
sudo -u builder PKGDEST=/mnt/out SRCDEST=/mnt/src_cache makepkg -sc --noconfirm

rm -rf /mnt/src/src
rm -rf /mnt/src/pkg

# The container should not be used again, so don't worry about cleaning up
