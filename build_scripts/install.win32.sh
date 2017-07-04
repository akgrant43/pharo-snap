#!/bin/bash
set -e

mkdir -p /usr/local/bin/pharo-vm
#cp -a scripts/pharo $1/usr/bin/pharo-vm/
cp -ar pharo-vm/opensmalltalk-vm/build.win32x86/pharo.cog.spur/build/vm/* /usr/local/bin/pharo-vm/
cp -a pharo-vm/sources/PharoV50.sources /usr/local/bin/pharo-vm/
cp -a pharo-vm/sources/PharoV60.sources /usr/local/bin/pharo-vm/
cp -a scripts32/getimage32 $1/usr/local/bin/

