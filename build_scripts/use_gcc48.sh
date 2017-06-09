#!/bin/bash
#
# Use the gcc-4.8 compiler (instead of the latest)
#
set -e

echo "Using gcc-4.8..."

# 32 bit VM
sed -i 's/gcc -m32/gcc-4.8 -m32/g' pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build/mvm
sed -i 's/g++ -m32/g++-4.8 -m32/g' pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/build/mvm

# 64 bit VM
sed -i 's/gcc -m64/gcc-4.8 -m64/g' pharo-vm/opensmalltalk-vm/build.linux64x64/pharo.cog.spur/build/mvm
sed -i 's/g++ -m64/g++-4.8 -m64/g' pharo-vm/opensmalltalk-vm/build.linux64x64/pharo.cog.spur/build/mvm

echo "gcc-4.8 configured"
