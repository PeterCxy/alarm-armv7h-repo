#!/bin/bash
# Update docker image first
./update-docker.sh

# Set packages to build in pkgs.conf
source ./pkgs.conf

for p in $PKGS; do
  echo "=> Building $p"
  ./build-pkg.sh $p
done

# Cleanup
paccache -c $PWD/repo -r
docker image prune -f # This delets dangling images, i.e. old versions of the docker image
