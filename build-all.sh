#!/bin/bash
# Update docker image first
./update-docker.sh

# Set packages to build in pkgs.conf
source ./pkgs.conf

for p in ${PKGS[@]}; do
  echo "=> Building $p"
  ./build-pkg.sh $p
done

# Cleanup
paccache -c $PWD/repo -r
docker image prune -f # This delets dangling images, i.e. old versions of the docker image

# Commit and push if necessary
if [[ ! -z $(git status -s) ]]; then
  git add -A
  git commit -a -m "[buildbot] Update on $(date)"
  git push
fi
