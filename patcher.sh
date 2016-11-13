#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
BRANCH=$ROM_TREE/patcher/ZNH5Y
CUSTOM=$ROM_TREE/patcher/sultan

SECURITY=$ROM_TREE/patcher/ZNH5Y/security
SECURITY_OCT16=$SECURITY/2016-10-01

APN_LIST_URL=https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-13.0/prebuilt/common/etc/apns-conf.xml

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/net/wifi
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/cyanogen
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Email
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/providers/TelephonyProvider
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Useful upstream patches not present on the branch in use
patch -d build					-p1 -s -N --no-backup-if-mismatch < $BRANCH/build0.patch
patch -d hardware/cyanogen			-p1 -s -N --no-backup-if-mismatch < $BRANCH/hardware-cyanogen0.patch

# Special git binary diff patches
cd vendor/cm
git apply $BRANCH/vendor-cm0.patch
cd $ROM_TREE

### Custom patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build1.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base4.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base5.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-native0.patch
patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-LockClock0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core2.patch

# Get APN list from nightly branch and apply patch on top
curl -s $APN_LIST_URL > vendor/cm/prebuilt/common/etc/apns-conf.xml

# Revert change that disables proximity check for power button
cd $ROM_TREE/frameworks/base
git revert --no-edit --no-commit 545dc46798d26328b6dc503663a771b37797eca5
cd $ROM_TREE

### Security patches
# 2016-10-01
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/build0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av1.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av3.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av4.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av5.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av6.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-av7.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-base4.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-native0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-native1.patch
patch -d frameworks/opt/net/wifi		-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-opt-net-wifi0.patch
patch -d frameworks/opt/net/wifi		-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/frameworks-opt-net-wifi1.patch
patch -d packages/apps/Email			-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/packages-apps-Email0.patch
patch -d packages/providers/TelephonyProvider	-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/packages-providers-TelephonyProvider0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SECURITY_OCT16/system-core0.patch

