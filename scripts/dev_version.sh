#!/bin/bash
#
# Answer the version postfix
#
cd pharo-vm/opensmalltalk-vm
echo -n $(git rev-list --count HEAD)-$(git rev-parse --short HEAD)
