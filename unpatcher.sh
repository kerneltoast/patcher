#!/bin/sh

# Remove previously-applied patches

# device/oppo/common:
cd device/oppo/common
git reset --hard
git clean -f -d

# device/qcom/common:
cd ../../../device/qcom/common
git reset --hard
git clean -f -d

# vendor/cm:
cd ../../../vendor/cm
git reset --hard
git clean -f -d

cd ../..
