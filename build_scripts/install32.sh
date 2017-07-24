#!/bin/bash
set -e

# Some of the files are installed as part of the 64 bit VM.
# Just add the remaining files
mkdir -p $1/usr/bin/pharo-vm32
cp -av pharo-vm/opensmalltalk-vm/products/phcogspurlinuxht/lib/pharo/5.0-*/* $1/usr/bin/pharo-vm32/
cp -a pharo-vm/sources/PharoV60.sources $1/usr/bin/pharo-vm32/
cp -a scripts32/cleanimage32 $1/usr/bin/
cp -a scripts32/getimage32 $1/usr/bin/
mkdir -p $1/var/Pharo/image32
cp -a image32/Pharo7.0-* $1/var/Pharo/image32/

