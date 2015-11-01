#!/bin/sh

# Apply these patches before compilation:

# device/oppo/common:
cd device/oppo/common
git reset --hard
wget https://github.com/CyanogenMod/android_device_oppo_common/commit/8387050e2d7de340394ffce6da60cc2a735539f5.patch
patch -p1 < 8387050e2d7de340394ffce6da60cc2a735539f5.patch
wget https://github.com/CyanogenMod/android_device_oppo_common/commit/30e63437f17c6cb75581f3bd80470f050c169bd5.patch
patch -p1 < 30e63437f17c6cb75581f3bd80470f050c169bd5.patch
git clean -f -d

# device/qcom/common:
cd ../../../device/qcom/common
git reset --hard
wget https://github.com/sultanxda/android_device_qcom_common/commit/480037b5f22278db54f52c3806ca0277a0a76ad9.patch
patch -p1 < 480037b5f22278db54f52c3806ca0277a0a76ad9.patch
git clean -f -d

# vendor/cm:
cd ../../../vendor/cm
git reset --hard
wget https://github.com/CyanogenMod/android_vendor_cm/commit/3ed1a3dd83c8bc1d81f8beeb09f2f4a3c1401ba6.patch
patch -p1 < 3ed1a3dd83c8bc1d81f8beeb09f2f4a3c1401ba6.patch
git clean -f -d

cd ../..
