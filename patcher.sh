#!/bin/sh

# Apply these patches before compilation:
CUSTOM=$PWD/patcher/custom
SULTAN=$PWD/patcher/sultan
ZX2C4=$PWD/patcher/zx2c4

# Clean up first
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

### Sultan's patches
git -C build				apply $SULTAN/build0.patch
git -C device/oppo/common		apply $SULTAN/device-oppo-common0.patch
git -C frameworks/av			apply $SULTAN/frameworks-av0.patch
git -C frameworks/base			apply $SULTAN/frameworks-base0.patch
git -C frameworks/base			apply $SULTAN/frameworks-base1.patch
git -C frameworks/base			apply $SULTAN/frameworks-base2.patch
git -C frameworks/base			apply $SULTAN/frameworks-base3.patch
git -C frameworks/base			apply $SULTAN/frameworks-base4.patch
git -C frameworks/native		apply $SULTAN/frameworks-native0.patch
git -C packages/apps/LockClock		apply $SULTAN/packages-apps-LockClock0.patch
git -C packages/apps/Settings		apply $SULTAN/packages-apps-Settings0.patch
git -C system/core			apply $SULTAN/system-core0.patch
git -C system/core			apply $SULTAN/system-core1.patch
git -C system/core			apply $SULTAN/system-core2.patch
git -C vendor/cm			apply $SULTAN/vendor-cm0.patch
git -C vendor/cm			apply $SULTAN/vendor-cm1.patch

### zx2c4's patches
$ZX2C4/wireguard-fetch.sh || rm -f $ZX2C4/wireguard-src.patch
git -C kernel/oneplus/msm8996		apply $ZX2C4/wireguard-src.patch

### Custom patches
git -C frameworks/av			apply $CUSTOM/frameworks-av0.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery20.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery21.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery22.patch
