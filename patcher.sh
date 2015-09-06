#!/bin/sh

# Apply these patches before compilation:

# frameworks/av:
cd frameworks/av
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_av/commit/523b5c5ee976cb8f0854dcccf58ef3bc0b276972.patch && patch -p1 < 523b5c5ee976cb8f0854dcccf58ef3bc0b276972.patch
wget https://github.com/CyanogenMod/android_frameworks_av/commit/df31a3368272dcf5671a1ca569d4769c205debad.patch && patch -p1 < df31a3368272dcf5671a1ca569d4769c205debad.patch
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_base/commit/b68ae542f9999a6314e3bc6a13db800e18d14fe5.patch && patch -p1 < b68ae542f9999a6314e3bc6a13db800e18d14fe5.patch
git clean -f -d

# packages/apps/Trebuchet:
cd ../../packages/apps/Trebuchet
git reset --hard
wget https://github.com/sultanxda/android_packages_apps_Trebuchet/commit/cb8b36c7d9f0cff549b0322eabedea6820d9b52c.patch && patch -p1 < cb8b36c7d9f0cff549b0322eabedea6820d9b52c.patch
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
wget https://github.com/sultanxda/android_system_core/commit/d19be9fd37f78524cae0cac302ce2b51f3fcfe5c.patch && patch -p1 < d19be9fd37f78524cae0cac302ce2b51f3fcfe5c.patch
git clean -f -d
