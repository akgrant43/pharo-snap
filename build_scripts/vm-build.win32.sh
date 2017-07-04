#!/bin/bash
set -e

echo "CD and build..."
cd pharo-vm/opensmalltalk-vm/build.win32x86/pharo.cog.spur
echo "Patching mvm to avoid questions..."
sed -i 's/^read a$/a="yes"/g' mvm
echo "Starting Build..."
./mvm

