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
git revert --no-edit a1dd1b926549e037dd19f41892ffcd59ea32692e
git revert --no-edit 9a549c0c928d146421148a46a54804888bbc646c
git revert --no-edit 20db575ecf4d85172751f3699843afcf0fc8df76
git revert --no-edit 2566acae69c9f708cb897e13311424f0d6804426
git revert --no-edit faac4f29e56e821a0c7711d0396fe1d992287c71
git revert --no-edit dead12819777607772b6e03e9752368553ad0ff2
git revert --no-edit 3fc6e6e9a2bbd5aca0399f6f53684b8509759fd3
git revert --no-edit c64e702fa936a062f32980b9788ecb6efe24c304
git revert --no-edit 128babae32990b0baf5294837ba93a292718daa5
git revert --no-edit 850e18bec0b7582640ea4d48a9e9bd2bdf3662cf
git revert --no-edit ec7119b0a4ecb6fb8f5bcab57dfbbb2386ad2475
git revert --no-edit e5f2945ca7fa723f4e5b90bbb6eae85bb4176720
git revert --no-edit 6bc2110a11f537fffc7f66adc30e947fecad9232
git revert --no-edit 4b23c79c976ed2363181b59b68b980a3498c0c7b
git revert --no-edit f84124c6ed8960a70e73955031c24bd493d7eaa1
git revert --no-edit 0a30b12934662757a4035f9cce448a1b506f0f0d
git revert --no-edit 9a8df5bc8488c19dc0a1951cad44956894a75a09
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
git am 33e931646d82761758478375d13b27d9cd0c3302.patch
git clean -f -d

# packages/apps/Settings:
cd ../../../packages/apps/Settings
git reset --hard && git clean -f -d
wget -q https://github.com/sultanxda/android_packages_apps_Settings/commit/8c98db9d683bf57bb6cb035e5f6bf3576eea508a.patch
patch -p1 -s < 8c98db9d683bf57bb6cb035e5f6bf3576eea508a.patch
wget -q https://github.com/sultanxda/android_packages_apps_Settings/commit/730f2ec307f43cc26c0d176ddffb8947edf6782c.patch
patch -p1 -s < 730f2ec307f43cc26c0d176ddffb8947edf6782c.patch
git clean -f -d

# packages/services/Telecomm:
cd ../../../packages/services/Telecomm
git reset --hard
git revert --no-edit 81999fd5012a33fd2e0c91ade9e3be63cdc8de7f

# prebuilts/cmsdk:
cd ../../../prebuilts/cmsdk
git reset --hard && git clean -f -d
git revert --no-edit 5c129188fa5b0f4a924b6eab6a6a8fd3d261bffd
git revert --no-edit 154fdff15315ae83ac31ef359f41a36c9e7b8180

# system/core:
cd ../../system/core
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
git revert --no-edit 647aa9c7eff9343a90a86f7376302092d35b60aa
git revert --no-edit d549053b2df52f27e43c43c2dca939b5428c322e
wget -q https://github.com/sultanxda/cm_platform_sdk/commit/2d9efe7427cf3d8a8134a5652192b5266a7335d1.patch
patch -p1 -s < 2d9efe7427cf3d8a8134a5652192b5266a7335d1.patch
git clean -f -d

cd ../..
