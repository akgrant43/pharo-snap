#!/bin/bash
#
# Synced with https://github.com/pharo-project/pharo-vm/blob/master/scripts/setup-ubuntu.sh

echo "Enable 32 bit architecture..."
dpkg --add-architecture i386
echo "Update apt..."
apt-get update
# Build tools
echo "Install tools..."
apt-get install -y cmake openssh-client openssh-server libtool automake autoconf git vim build-essential ack-grep zip bash-completion ruby xz-utils debhelper devscripts gcc-multilib g++ libext-dev
apt-get install -y libasound2-dev libssl-dev libfreetype6-dev libx11-dev libxext-dev gcc-multilib uuid-dev libssh2-1-dev libgl1-mesa-dev libpulse-dev:i386 libglib2.0-dev:i386

# Runtime packages
echo "Install runtime packages..."
apt-get install -y libc6-dev:i386 libasound2:i386 libasound2-dev:i386 libasound2-plugins:i386 libssl-dev:i386 libssl0.9.8:i386 libfreetype6-dev:i386 libx11-dev:i386 libsm-dev:i386 libice-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev:i386 libxext-dev:i386 libglapi-mesa:i386 uuid-dev:i386
apt-get install -y libssl1.0.0:i386 libssl-dev:i386

# General upgrade
apt-get upgrade -y
