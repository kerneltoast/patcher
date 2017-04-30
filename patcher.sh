#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
SULTAN=$PATCHER_PATH/sultan
CUSTOM=$PATCHER_PATH/custom

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard

cd $ROM_TREE

### Sultan's patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SULTAN/build0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base4.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base5.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-native0.patch
patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $SULTAN/packages-apps-LockClock0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core1.patch
