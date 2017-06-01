#!/bin/bash
set -e

mkdir -p $1/usr/bin/pharo-vm
cp -a scripts/pharo $1/usr/bin/pharo-vm/
cp -a filemagic $1/usr/bin/pharo-vm/
cp -a pharo.sh $1/usr/bin/pharo
cp -ar pharo-vm/opensmalltalk-vm/products/cogspur64linuxht/lib/pharo/5.0-* $1/usr/bin/pharo-vm/
cp -a pharo-vm/sources/PharoV60.sources $1/usr/bin/pharo-vm/5.0-*/
cp -a cleanimage $1/usr/bin/
cp -a getimage $1/usr/bin/
cp -a CONFIG $1/usr/bin/
mkdir -p $1/var/Pharo/image
cp -a image64/Pharo.image image64/Pharo.changes $1/var/Pharo/image/

