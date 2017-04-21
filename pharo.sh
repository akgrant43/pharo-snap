#!/usr/bin/env bash
# some magic to find out the real location of this script dealing with symlinks
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 
# disable parameter expansion to forward all arguments unprocessed to the VM
set -f
# Try and determine the image format (which VM to use)
origargs="$@"
imagename=""
while [[ ($# -gt 0) ]]
do
  if [ "${1:0:1}" != "-" -a "$imagename" == "" -a -f "$1" ]
  then
     imagename="$1"
  fi
  shift
done
if [ -n "$imagename" ]
then
  imageversion=`file -m $DIR/pharo-vm/filemagic $imagename`
else
  imageversion=""
fi
# If it's a 32bit image, use the 32 bit compiler, otherwise assume 64bits
case "$imageversion" in
   *"Smalltalk image Spur 32b"*)
       export HOSTFS=$SNAP
       export LD_LIBRARY_PATH="$HOSTFS/usr/lib/i386-linux-gnu/libfakeroot:$HOSTFS/usr/local/lib:$HOSTFS/lib/i386-linux-gnu:$HOSTFS/usr/lib/i386-linux-gnu:$HOSTFS/usr/lib/i386-linux-gnu/mesa-egl:$HOSTFS/usr/lib/i386-linux-gnu/mesa:$HOSTFS/lib32:$HOSTFS/usr/lib32:$LD_LIBRARY_PATH"
       export PATH="$HOSTFS/usr/local/sbin:$HOSTFS/usr/local/bin:$HOSTFS/usr/sbin:$HOSTFS/usr/bin:$HOSTFS/sbin:$HOSTFS/bin:$PATH"
       pharoexe="$DIR"/"pharo-vm32/pharo"
       ;;
   *)
       export HOSTFS=$SNAP
       export LD_LIBRARY_PATH="$HOSTFS/usr/lib/x86_64-linux-gnu/libfakeroot:$HOSTFS/usr/local/lib:$HOSTFS/lib/x86_64-linux-gnu:$HOSTFS/usr/lib/x86_64-linux-gnu:$HOSTFS/usr/lib/x86_64-linux-gnu/mesa-egl:$HOSTFS/usr/lib/x86_64-linux-gnu/mesa:$HOSTFS/lib32:$HOSTFS/usr/lib32:$LD_LIBRARY_PATH"
       export PATH="$HOSTFS/usr/local/sbin:$HOSTFS/usr/local/bin:$HOSTFS/usr/sbin:$HOSTFS/usr/bin:$HOSTFS/sbin:$HOSTFS/bin:$PATH"
       pharoexe="$DIR"/"pharo-vm/pharo"
       ;;
esac
# run the VM and pass along all arguments as is
$pharoexe $origargs
