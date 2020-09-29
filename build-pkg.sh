#!/bin/bash
# This file should be run from host

usage() {
  echo "./build-pkg.sh <package_name>"
}

if [ -z "$1" ]; then
  usage
  exit 1
fi

source ./hook.sh
pkg_build_start $1

mkdir /tmp/alarm-build-tmp
docker run --rm -e OUTSIDE_UID=$UID -v /tmp/alarm-build-tmp:/mnt/out -v $PWD/pkgs/$1:/mnt/src -v $PWD/src:/mnt/src_cache -v $PWD/repo:/mnt/repo --tmpfs /tmp:exec,mode=777 alarm-builder:latest || pkg_build_fail $1

pushd ./repo
for f in $(find /tmp/alarm-build-tmp/ -type f); do
  cp $f ./
  repo-add petercxy-armv7h.db.tar.xz $f
done
popd

rm -rf /tmp/alarm-build-tmp

pkg_build_end $1
