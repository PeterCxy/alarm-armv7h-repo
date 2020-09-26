#!/bin/bash
# This file is executed INSIDE the alarm container
# The container might be a little bit out-of-date, so
# always update it first
pacman -Syu

export PKGDEST=/mnt/out
export SRCDEST=/tmp
export SRCPKGDEST=/tmp

cd /mnt/src
makepkg -sci
