#!/bin/bash
set -e
#
# Get all the source files required to build the Pharo VMs.
#
# This can be run either before the snapcraft command to save bandwidth
# during multiple builds, or as part of the snapcraft command to ensure
# latest sources are always used
#
# Common URLs for downloading ZeroConf versions:
#
#   V70 VM: http://get.pharo.org/vm70
#           http://files.pharo.org/get-files/70/
#

echo "Get all sources..."

if [ ! -f PharoV60.sources ]
then
    echo "Get PharoV60.sources..."
    wget --no-verbose http://files.pharo.org/get-files/60/sources.zip
    unzip sources.zip
    rm sources.zip
fi

if [ ! -d pharo-vm/opensmalltalk-vm ]
then
    echo "Get vm sources..."
    if [ ! -d pharo-vm ]
    then
        mkdir pharo-vm
    fi
    pushd pharo-vm
    git clone https://github.com/OpenSmalltalk/opensmalltalk-vm.git
    popd
    pushd pharo-vm/opensmalltalk-vm
    git checkout 6a2c4f4
    popd
    echo "Set up version info..."
    pushd pharo-vm/opensmalltalk-vm
    scripts/updateSCCSVersions
    popd
fi

if [ ! -d pharo-vm/sources ]
then
    echo "Add PharoV60.sources..."
    mkdir pharo-vm/sources
    cp PharoV60.sources pharo-vm/sources/
fi

if [ ! -d image32 ]
then
    echo "Get 32 bit image..."
    mkdir image32
    cd image32
    wget --no-verbose http://files.pharo.org/image/70/latest.zip
    unzip latest.zip
    cd ..
fi

if [ ! -d image64 ]
then
    echo "Get 64 bit image..."
    mkdir image64
    cd image64
    wget --no-verbose http://files.pharo.org/image/70/latest-64.zip
    unzip latest-64.zip
    cd ..
fi

