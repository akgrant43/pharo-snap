#!/bin/bash
echo "Get source..."
git clone --depth 1 https://github.com/pharo-project/pharo-vm.git
echo "Add PharoV50.sources..."
mkdir pharo-vm/sources
cp PharoV50.sources pharo-vm/sources/
echo "Environment vars..."
env
echo "Environment vars done"
cd pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build
./mvm
