#!/bin/bash
#
# Patch the sources to include FileAttributes for pharo.cog.spur on:
#   linux 32 bit, linux 64 bit
#

echo "Update FileAttributesPlugin source"
cp -ar patches/FileAttributesPlugin pharo-vm/opensmalltalk-vm/platforms/unix/plugins/
grep -q FileAttributesPlugin pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/plugins.ext
if [ $? -eq 1 ]
then
echo "Add 32 bit plugin"
sed -i '/AioPlugin/i \
FileAttributesPlugin \\' \
	pharo-vm/opensmalltalk-vm/build.linux32x86/pharo.cog.spur/plugins.ext
fi

grep -q FileAttributesPlugin pharo-vm/opensmalltalk-vm/build.linux64x64/pharo.cog.spur/plugins.ext
if [ $? -eq 1 ]
then
echo "Add 64 bit plugin"
sed -i '/AioPlugin/i \
FileAttributesPlugin \\' \
	pharo-vm/opensmalltalk-vm/build.linux64x64/pharo.cog.spur/plugins.ext
fi

cp -ar patches/FileAttributesPlugin pharo-vm/opensmalltalk-vm/platforms/win32/plugins/
grep -q FileAttributesPlugin pharo-vm/opensmalltalk-vm/build.win32x86/pharo.cog.spur/plugins.ext
if [ $? -eq 1 ]
then
echo "Add win32 plugin"
sed -i '/EXTERNAL_PLUGINS = \\/a \
FileAttributesPlugin \\' \
	pharo-vm/opensmalltalk-vm/build.win32x86/pharo.cog.spur/plugins.ext
fi

grep -q FileAttributesPlugin pharo-vm/opensmalltalk-vm/build.win64x64/pharo.cog.spur/plugins.ext
if [ $? -eq 1 ]
then
echo "Add win64 plugin"
sed -i '/EXTERNAL_PLUGINS = \\/a \
FileAttributesPlugin \\' \
	pharo-vm/opensmalltalk-vm/build.win64x64/pharo.cog.spur/plugins.ext
fi


