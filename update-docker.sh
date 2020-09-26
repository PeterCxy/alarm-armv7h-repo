#!/bin/bash
docker pull agners/archlinuxarm-arm64v8:latest
docker build --rm . -t alarm-builder:latest
