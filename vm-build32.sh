#!/bin/bash
set -e

export AKGBUILDDIR=`pwd`
echo "CD and build..."
cd pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build
echo "Patching mvm to avoid questions..."
sed -i 's/^read a$/a="yes"/g' mvm
echo "Starting Build..."
./mvm
#
# 32 bit snap packages with classic confinement won't find the loader.
# Patch the ELF to point to the correct location
#
cd $AKGBUILDDIR
export PHAROVM=`find ./pharo-vm/opensmalltalk-vm/products/phcogspurlinuxht/lib/pharo -name pharo -type f`
patchelf --set-interpreter /snap/pharo/current/lib/ld-linux.so.2 $PHAROVM
echo "Patched ELF..."
ls -lh $PHAROVM
strings $PHAROVM | grep ld-linux

