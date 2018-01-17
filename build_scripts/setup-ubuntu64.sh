#!/bin/bash
#
# Synced with https://github.com/pharo-project/pharo-vm/blob/master/scripts/setup-ubuntu.sh

echo "Update apt..."
apt-get update
# Build tools
echo "Install tools..."
apt-get install -y cmake openssh-client openssh-server libtool automake autoconf git vim build-essential ack-grep zip bash-completion ruby xz-utils debhelper devscripts gcc-multilib g++ libext-dev
apt-get install -y libasound2-dev libssl-dev libfreetype6-dev libx11-dev libxext-dev gcc-multilib uuid-dev libssh2-1-dev libgl1-mesa-dev unzip zip
# libglib2.0-dev:i386 

# General upgrade
apt-get upgrade -y
