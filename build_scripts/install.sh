#!/bin/bash
set -e

mkdir -p $1/usr/bin/pharo-vm
cp -a scripts/pharo $1/usr/bin/pharo-vm/
cp -a scripts/filemagic $1/usr/bin/pharo-vm/
cp -a scripts/pharo.sh $1/usr/bin/pharo
cp -arv pharo-vm/opensmalltalk-vm/products/cogspur64linuxht/lib/pharo/5.0-* $1/usr/bin/pharo-vm/
cp -a pharo-vm/sources/PharoV60.sources $1/usr/bin/pharo-vm/5.0-*/
cp -a scripts/cleanimage $1/usr/bin/
cp -a scripts/getimage $1/usr/bin/
cp -a scripts/CONFIG $1/usr/bin/
mkdir -p $1/var/Pharo/image
cp -a image64/Pharo7.0-* $1/var/Pharo/image/

