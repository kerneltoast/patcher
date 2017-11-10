#!/bin/sh

# Clean up
git -C build				clean -dfqx
git -C build				reset -q --hard
git -C device/oppo/common		clean -dfqx
git -C device/oppo/common		reset -q --hard
git -C frameworks/av			clean -dfqx
git -C frameworks/av			reset -q --hard
git -C frameworks/base			clean -dfqx
git -C frameworks/base			reset -q --hard
git -C frameworks/native		clean -dfqx
git -C frameworks/native		reset -q --hard
git -C kernel/oneplus/msm8996		clean -dfqx
git -C kernel/oneplus/msm8996		reset -q --hard
git -C packages/apps/Gallery2		clean -dfqx
git -C packages/apps/Gallery2		reset -q --hard
git -C packages/apps/LockClock		clean -dfqx
git -C packages/apps/LockClock		reset -q --hard
git -C packages/apps/Settings		clean -dfqx
git -C packages/apps/Settings		reset -q --hard
git -C system/core			clean -dfqx
git -C system/core			reset -q --hard
git -C vendor/cm			clean -dfqx
git -C vendor/cm			reset -q --hard
