#!/bin/bash
set -e

echo "Get source..."
git clone --depth 1 --branch Issue19890 https://github.com/akgrant43/pharo-vm.git 
echo "Set up version info..."
cd pharo-vm
../genVersion.sh
cd ..
echo "Add PharoV50.sources..."
mkdir pharo-vm/sources
cp PharoV50.sources pharo-vm/sources/
echo "CD and build..."
cd pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build
./mvm
