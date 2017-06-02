#!/bin/bash
set -e

echo "CD and build..."
cd pharo-vm/opensmalltalk-vm/build.linux64x64/pharo.cog.spur/build
echo "Patching mvm to avoid questions..."
sed -i 's/^read a$/a="yes"/g' mvm
echo "Starting Build..."
./mvm

