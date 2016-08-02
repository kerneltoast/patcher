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
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/CellBroadcastReceiver
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Dialer
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/InCallUI
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Nfc
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Stk
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/providers/TelephonyProvider
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telecomm
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Useful upstream patches not present on the branch in use
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-base0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-native0.patch
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony0.patch
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony1.patch
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony2.patch
patch -d frameworks/opt/telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/frameworks-opt-telephony3.patch
patch -d packages/apps/CellBroadcastReceiver	-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-CellBroadcastReceiver0.patch
patch -d packages/apps/Dialer			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Dialer0.patch
patch -d packages/apps/InCallUI			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-InCallUI0.patch
patch -d packages/apps/Nfc			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Nfc0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Settings0.patch
patch -d packages/apps/Stk			-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-apps-Stk0.patch
patch -d packages/providers/TelephonyProvider	-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-providers-TelephonyProvider0.patch
patch -d packages/services/Telecomm		-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-services-Telecomm0.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-services-Telephony0.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-services-Telephony1.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $BRANCH/packages-services-Telephony2.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $BRANCH/system-core0.patch

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
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
