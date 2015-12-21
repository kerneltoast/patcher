#!/bin/sh

# Apply these patches before compilation:

# frameworks/av:
cd frameworks/av
git reset --hard
wget https://github.com/sultanxda/android_frameworks_av/commit/44b8ecca7a07b05c71e595c03750a9f5915bce35.patch
patch -p1 < 44b8ecca7a07b05c71e595c03750a9f5915bce35.patch
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard
wget https://github.com/sultanxda/android_frameworks_base/commit/2002fc9e3233171e2cd821728f3c98c945ce00c6.patch
patch -p1 < 2002fc9e3233171e2cd821728f3c98c945ce00c6.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/c783d6643ecc607e917e27091bb4d6b126c470d4.patch
patch -p1 < c783d6643ecc607e917e27091bb4d6b126c470d4.patch
wget https://github.com/sultanxda/android_frameworks_base/commit/1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
patch -p1 < 1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
wget https://github.com/sultanxda/android_frameworks_base/commit/7cd529d08fe2087006c5aa5c47dc730ff0ad4022.patch
patch -p1 < 7cd529d08fe2087006c5aa5c47dc730ff0ad4022.patch
git clean -f -d

# packages/apps/Trebuchet:
cd ../../packages/apps/Trebuchet
git reset --hard
wget https://github.com/sultanxda/android_packages_apps_Trebuchet/commit/5cbf273ce872ed51887e90cd54ef0283ac2987b6.patch
patch -p1 < 5cbf273ce872ed51887e90cd54ef0283ac2987b6.patch
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
wget https://github.com/sultanxda/android_system_core/commit/a1702ced972dff3608d3808cfe61b524af887804.patch
patch -p1 < a1702ced972dff3608d3808cfe61b524af887804.patch
git clean -f -d

cd ../..
