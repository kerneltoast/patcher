#!/bin/sh

ROM_TREE=$PWD

# Clean up
cd $ROM_TREE/bionic
git clean -f -d && git reset --hard
cd $ROM_TREE/bootable/recovery
git clean -f -d && git reset --hard
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/external/boringssl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libavc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libhevc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libmpeg2
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnfc-nci
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libopus
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libvpx
git clean -f -d && git reset --hard
cd $ROM_TREE/external/skia
git clean -f -d && git reset --hard
cd $ROM_TREE/external/sonivox
git clean -f -d && git reset --hard
cd $ROM_TREE/external/tremolo
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/ex
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/net/wifi
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/libhardware
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Bluetooth
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/CertInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/PackageInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/UnifiedEmail
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cmsdk
git clean -f -d && git reset --hard

cd $ROM_TREE
