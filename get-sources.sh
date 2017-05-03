#!/bin/bash
set -e
#
# Get all the source files required to build the Pharo VMs.
#
# This can be run either before the snapcraft command to save bandwidth
# during multiple builds, or as part of the snapcraft command to ensure
# latest sources are always used
#

echo "Get all sources..."

if [ ! -f PharoV50.sources ]
then
    echo "Get PharoV50.sources..."
    wget --no-verbose http://files.pharo.org/sources/PharoV50.sources.zip
    unzip PharoV50.sources.zip
fi

if [ ! -d pharo-vm ]
then
    echo "Get vm sources..."
    git clone https://github.com/akgrant43/pharo-vm.git
    #git clone https://github.com/pharo-project/pharo-vm.git
    #git clone https://github.com/OpenSmalltalk/opensmalltalk-vm.git
    #pushd pharo-vm
    #git checkout 1c38b03
    #popd
    echo "Set up version info..."
    pushd pharo-vm
    ../genVersion.sh
    popd
    echo "Add PharoV50.sources..."
    mkdir pharo-vm/sources
    cp PharoV50.sources pharo-vm/sources/
fi

if [ ! -d image32 ]
then
    echo "Get 32 bit image..."
    mkdir image32
    cd image32
    wget --no-verbose http://files.pharo.org/image/60/latest.zip
    unzip latest.zip
    mv Pharo-6*.image Pharo.image
    mv Pharo-6*.changes Pharo.changes
    cd ..
fi

if [ ! -d image64 ]
then
    echo "Get 64 bit image..."
    mkdir image64
    cd image64
    wget --no-verbose http://files.pharo.org/image/60/latest-64.zip
    unzip latest-64.zip
    mv Pharo64-6*.image Pharo.image
    mv Pharo64-6*.changes Pharo.changes
    cd ..
fi

