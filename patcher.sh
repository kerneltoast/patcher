#!/bin/sh

# Apply these patches before compilation:

# frameworks/av:
cd frameworks/av
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_av/commit/25497dcfac47704d53f1dba7fba16d24786aa7e5.patch
patch -p1 < 25497dcfac47704d53f1dba7fba16d24786aa7e5.patch
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard
wget https://github.com/CyanogenMod/android_frameworks_base/commit/f53f47232674caf2a03482f8e7fe5be8e01adfa3.patch
patch -p1 < f53f47232674caf2a03482f8e7fe5be8e01adfa3.patch
wget https://github.com/CyanogenMod/android_frameworks_base/commit/c783d6643ecc607e917e27091bb4d6b126c470d4.patch
patch -p1 < c783d6643ecc607e917e27091bb4d6b126c470d4.patch
wget https://github.com/sultanxda/android_frameworks_base/commit/1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
patch -p1 < 1849d8f5b274a69bd3b11566005659e6f94ec25b.patch
git clean -f -d

# packages/apps/Settings:
cd ../../packages/apps/Settings
git reset --hard
wget https://github.com/sultanxda/android_packages_apps_Settings/commit/afb73252dd27e7a725ae823101fd47aa0938d3d9.patch
patch -p1 < afb73252dd27e7a725ae823101fd47aa0938d3d9.patch
wget https://github.com/CyanogenMod/android_packages_apps_Settings/commit/7960e7e18e070a64343d5020e8bf852886ef46ae.patch
patch -p1 < 7960e7e18e070a64343d5020e8bf852886ef46ae.patch
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
wget https://github.com/sultanxda/android_system_core/commit/a1702ced972dff3608d3808cfe61b524af887804.patch
patch -p1 < a1702ced972dff3608d3808cfe61b524af887804.patch
git clean -f -d

cd ../..
