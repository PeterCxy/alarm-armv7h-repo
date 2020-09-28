#!/bin/bash
docker pull agners/archlinuxarm-arm32v7:latest
docker build --rm . -t alarm-builder:latest
