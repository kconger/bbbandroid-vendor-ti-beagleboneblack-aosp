#!/bin/sh
# Execute this shell script to apply various patches to the Android
# codebase. Be sure to execute the script from the root of the 
# Android codebase (where patch.sh is located).

# CallStack backwards compatibility with SGX binary blob 
# From Chris Simmonds (csimmonds@2net.co.uk)  
cd system/core
patch -p1 < ../../device/ti/beagleboneblack/patches/0001-Fix-CallStack-API.patch
cd ../..

# Bionic patch to fix nlink type
# https://android.googlesource.com/platform/bionic.git/+/ff5b0fc8f3406c98561e17bd2a6c5433e192f5be%5E1..ff5b0fc8f3406c98561e17bd2a6c5433e192f5be/
cd bionic
patch -p1 < ../device/ti/beagleboneblack/patches/0001-Fix-nlink-type.patch
cd ../

# Remove emulator check for bluetooth since we need qemu=1
cd frameworks/base 
patch -p1 < ../../device/ti/beagleboneblack/patches/SystemServer.java.patch
cd ../..

# Show battery icon as always powered
cd system/core
patch -p1 < ../../device/ti/beagleboneblack/patches/0008-ENGR00289825-Make-simulated-battery-status-report-ba.patch
cd ../..
