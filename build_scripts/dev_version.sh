#!/bin/bash
#
# Answer the version postfix
#
OSVMDIR=""
if [ -d "pharo-vm/opensmalltalk-vm" ]
then
    OSVMDIR="pharo-vm/opensmalltalk-vm"
fi
if [ -d "parts/pharo/build/pharo-vm/opensmalltalk-vm" ]
then
    OSVMDIR="parts/pharo/build/pharo-vm/opensmalltalk-vm"
fi
cd $OSVMDIR
echo -n $(git rev-list --count HEAD)-$(git rev-parse --short HEAD)
