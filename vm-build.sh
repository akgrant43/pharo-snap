#!/bin/bash
set -e

echo "Get sources..."
git clone --depth 1 --branch Issue19890 https://github.com/akgrant43/pharo-vm.git 
wget http://files.pharo.org/sources/PharoV50.sources.zip
unzip PharoV50.sources.zip
echo "Set up version info..."
cd pharo-vm
../genVersion.sh
cd ..
echo "Add PharoV50.sources..."
mkdir pharo-vm/sources
cp PharoV50.sources pharo-vm/sources/
export AKGBUILDDIR=`pwd`
echo "CD and build..."
#export LDFLAGS="-Wl,--dynamic-linker=/snap/pharo/x1/lib/ld-linux.so.2"
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
pwd
ls -lh
export PHAROVM=`find ./pharo-vm/opensmalltalk-vm/products/phcogspurlinuxht/lib/pharo -name pharo -type f`
patchelf --set-interpreter /snap/pharo/current/lib/ld-linux.so.2 $PHAROVM
echo "Patched ELF..."
ls -lh $PHAROVM
strings $PHAROVM | grep ld-linux

