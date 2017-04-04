#! /bin/bash

echo "`cat opensmalltalk-vm/platforms/Cross/vm/sqSCCSVersion.h | opensmalltalk-vm/.git_filters/RevDateURL.smudge`" > opensmalltalk-vm/platforms/Cross/vm/sqSCCSVersion.h
echo "`cat opensmalltalk-vm/platforms/Cross/plugins/sqPluginsSCCSVersion.h | opensmalltalk-vm/.git_filters/RevDateURL.smudge`" > opensmalltalk-vm/platforms/Cross/plugins/sqPluginsSCCSVersion.h

