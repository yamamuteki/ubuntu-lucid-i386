#!/bin/sh

# This script make a Docker image of the Ubuntu 10.04 Lucid i386 (32bit).
# Please run as root via sudo on your Ubuntu 14.04 LTS machine (Not docker container as AWS EC2).
# Reference: http://hatyuki.hatenablog.jp/entry/2014/11/20/135728
cd /tmp
apt-get update
apt-get install -y git debootstrap binutils

# Fix version for a patch.
git clone --depth 1 -b v1.9.1 https://github.com/docker/docker.git
cd docker/contrib

# Make a Docker image from lucid http://archive.ubuntu.com/ubuntu/.
./mkimage.sh -d "../../" debootstrap  --verbose --variant=minbase --include=iproute,gpgv --arch=i386 lucid http://archive.ubuntu.com/ubuntu/

