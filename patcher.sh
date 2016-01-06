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
wget https://github.com/CyanogenMod/android_frameworks_base/commit/06c39e200cd5edfb6019cd725343654e1d9a8fe3.patch
patch -p1 < 06c39e200cd5edfb6019cd725343654e1d9a8fe3.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/2fa41c618a8a3ed681e8604c04d2002ee9767dfa.patch
patch -p1 < 2fa41c618a8a3ed681e8604c04d2002ee9767dfa.patch
git clean -f -d

# frameworks/opt/telephony:
cd ../../frameworks/opt/telephony
git reset --hard
wget https://github.com/sultanxda/android_frameworks_opt_telephony/commit/279bcac13acffa186483aff97f359597a8875b18.patch
patch -p1 < 279bcac13acffa186483aff97f359597a8875b18.patch
git clean -f -d

# packages/apps/Trebuchet:
cd ../../../packages/apps/Trebuchet
git reset --hard
wget https://github.com/sultanxda/android_packages_apps_Trebuchet/commit/5cbf273ce872ed51887e90cd54ef0283ac2987b6.patch
patch -p1 < 5cbf273ce872ed51887e90cd54ef0283ac2987b6.patch
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
wget https://github.com/sultanxda/android_system_core/commit/c407c8a2299183ce0fd0e7f7b1c026a66b5adb8d.patch
patch -p1 < c407c8a2299183ce0fd0e7f7b1c026a66b5adb8d.patch
git clean -f -d
cd ../..
