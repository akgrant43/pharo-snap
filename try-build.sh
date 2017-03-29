#!/bin/bash
set -e

echo "Get source..."
git clone --depth 1 https://github.com/pharo-project/pharo-vm.git
#echo "Checkout 30fd8c40a17dd8241ae92f463dd183916bdca716..."
#cd pharo-vm; git checkout 30fd8c40a17dd8241ae92f463dd183916bdca716
#cd ..
echo "Set up version info..."
cd pharo-vm
../genVersion.sh
cd ..
echo "Add PharoV50.sources..."
mkdir pharo-vm/sources
cp PharoV50.sources pharo-vm/sources/
echo "Environment vars..."
env
echo "Environment vars done"
cd pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build
./mvm
