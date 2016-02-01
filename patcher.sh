#!/bin/sh

# Apply these patches before compilation:

# frameworks/base:
cd frameworks/base
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_base/commit/e75f59e7fd349dd1fa5d452086c795f693776d89.patch
patch -p1 < e75f59e7fd349dd1fa5d452086c795f693776d89.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/06c39e200cd5edfb6019cd725343654e1d9a8fe3.patch
patch -p1 < 06c39e200cd5edfb6019cd725343654e1d9a8fe3.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/2fa41c618a8a3ed681e8604c04d2002ee9767dfa.patch
patch -p1 < 2fa41c618a8a3ed681e8604c04d2002ee9767dfa.patch
git clean -f -d
cd ../..
