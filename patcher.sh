#!/bin/sh

# Apply these patches before compilation:

# build:
cd build
git reset --hard && git clean -f -d
wget -q https://github.com/CyanogenMod/android_build/commit/c1b06c9b6c7b8ed684033894059a2a859f85e708.patch
patch -p1 -s < c1b06c9b6c7b8ed684033894059a2a859f85e708.patch
git clean -f -d

# frameworks/av:
cd ../frameworks/av
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/android_frameworks_av/commit/44b8ecca7a07b05c71e595c03750a9f5915bce35.patch
patch -p1 -s < 44b8ecca7a07b05c71e595c03750a9f5915bce35.patch
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/android_frameworks_base/commit/2002fc9e3233171e2cd821728f3c98c945ce00c6.patch
patch -p1 -s < 2002fc9e3233171e2cd821728f3c98c945ce00c6.patch
wget -q https://github.com/CyanogenMod/android_frameworks_base/commit/c783d6643ecc607e917e27091bb4d6b126c470d4.patch
patch -p1 -s < c783d6643ecc607e917e27091bb4d6b126c470d4.patch
wget -q https://github.com/sultanxda/android_frameworks_base/commit/1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
patch -p1 -s < 1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
git clean -f -d

# packages/apps/Messaging:
cd ../../packages/apps/Messaging
git reset --hard && git clean -f -d
wget -q https://github.com/CyanogenMod/android_packages_apps_Messaging/commit/33e931646d82761758478375d13b27d9cd0c3302.patch
patch -p1 -s < 33e931646d82761758478375d13b27d9cd0c3302.patch
git clean -f -d

# packages/apps/Settings:
cd ../../../packages/apps/Settings
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/android_packages_apps_Settings/commit/24e39943c5734192722aa0745213e14708a24225.patch
patch -p1 -s < 24e39943c5734192722aa0745213e14708a24225.patch
wget -q https://github.com/sultanxda/android_packages_apps_Settings/commit/730f2ec307f43cc26c0d176ddffb8947edf6782c.patch
patch -p1 -s < 730f2ec307f43cc26c0d176ddffb8947edf6782c.patch
git clean -f -d

# packages/services/Telecomm:
cd ../../../packages/services/Telecomm
git reset --hard
git revert --no-edit 81999fd5012a33fd2e0c91ade9e3be63cdc8de7f

# system/core:
cd ../../../system/core
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/android_system_core/commit/a1702ced972dff3608d3808cfe61b524af887804.patch
patch -p1 -s < a1702ced972dff3608d3808cfe61b524af887804.patch
wget -q https://github.com/sultanxda/android_system_core/commit/c520a4af51d1011644541a53925c77d9addedf32.patch
patch -p1 -s < c520a4af51d1011644541a53925c77d9addedf32.patch
git clean -f -d

# vendor/cm:
cd ../../vendor/cm/prebuilt/common/etc
git reset --hard && git clean -f -d
rm apns-conf.xml
wget -q https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-13.0/prebuilt/common/etc/apns-conf.xml
cd ../../..
wget -q https://github.com/sultanxda/android_vendor_cm/commit/c32045e4a52723c3ccfd59266bd35fab6a4c0468.patch
patch -p1 < c32045e4a52723c3ccfd59266bd35fab6a4c0468.patch
git clean -f -d

# vendor/cmsdk:
cd ../../vendor/cmsdk
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/cm_platform_sdk/commit/2d9efe7427cf3d8a8134a5652192b5266a7335d1.patch
patch -p1 -s < 2d9efe7427cf3d8a8134a5652192b5266a7335d1.patch
git clean -f -d

cd ../..
