#!/bin/sh

# Apply these patches before compilation:

# frameworks/av:
cd frameworks/av
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_av/commit/df31a3368272dcf5671a1ca569d4769c205debad.patch
patch -p1 < df31a3368272dcf5671a1ca569d4769c205debad.patch
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_base/commit/b68ae542f9999a6314e3bc6a13db800e18d14fe5.patch
patch -p1 < b68ae542f9999a6314e3bc6a13db800e18d14fe5.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/e75f59e7fd349dd1fa5d452086c795f693776d89.patch
patch -p1 < e75f59e7fd349dd1fa5d452086c795f693776d89.patch
wget https://github.com/sultanxda/android_frameworks_base/commit/0cbd4a88767d78640b7dd391674575f7d5e517e6.patch
patch -p1 < 0cbd4a88767d78640b7dd391674575f7d5e517e6.patch
git clean -f -d

# packages/apps/Trebuchet:
cd ../../packages/apps/Trebuchet
git reset --hard
wget https://github.com/sultanxda/android_packages_apps_Trebuchet/commit/85657ceea63d4e85b1115679afe08ca0759f832d.patch
patch -p1 < 85657ceea63d4e85b1115679afe08ca0759f832d.patch
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
wget https://github.com/sultanxda/android_system_core/commit/c407c8a2299183ce0fd0e7f7b1c026a66b5adb8d.patch
patch -p1 < c407c8a2299183ce0fd0e7f7b1c026a66b5adb8d.patch
git clean -f -d
cd ../..
