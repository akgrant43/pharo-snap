#!/bin/bash
set -e
#
# Remove all the source files required to build the Pharo VMs.
#

echo "Remove all sources..."
if [ -d pharo-vm ]
then
    echo "Remove vm sources..."
    rm -r pharo-vm
fi

if [ -d image32 ]
then
    echo "Remove 32 bit image..."
    rm -r image32
fi

if [ -d image64 ]
then
    echo "Remove 64 bit image..."
    rm -r image64
fi

