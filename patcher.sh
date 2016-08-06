#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
BRANCH=$ROM_TREE/patcher/ZNH2K
CUSTOM=$ROM_TREE/patcher/sultan

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Dialer
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Nfc
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/bt
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Useful upstream patches not present on the branch in use
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony0.patch
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony1.patch
patch -d packages/apps/Dialer			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Dialer0.patch
patch -d packages/apps/Nfc			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Nfc0.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-services-Telephony0.patch
patch -d system/bt				-p1 -s -N --no-backup-if-mismatch < $BRANCH/system-bt0.patch

# Special git binary diff patch
cd packages/apps/Messaging
git apply $BRANCH/packages-apps-Messaging0.patch
cd $ROM_TREE

### Custom patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base4.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
