#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
BRANCH=$ROM_TREE/patcher/ZNH5Y
CUSTOM=$ROM_TREE/patcher/sultan

APN_LIST_URL=https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-13.0/prebuilt/common/etc/apns-conf.xml

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Eleven
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Useful upstream patches not present on the branch in use
patch -d build					-p1 -s -N --no-backup-if-mismatch < $BRANCH/build0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $BRANCH/build1.patch

# Special git binary diff patches
cd vendor/cm
git apply $BRANCH/vendor-cm0.patch
cd $ROM_TREE

### Custom patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build1.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base4.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base5.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base6.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core2.patch

# Get APN list from nightly branch and apply patch on top
curl -s $APN_LIST_URL > vendor/cm/prebuilt/common/etc/apns-conf.xml

# Revert media key patches to Eleven, as Eleven randomly starts playing
# music with them when no headset is plugged in
cd $ROM_TREE/packages/apps/Eleven
git revert --no-edit --no-commit 89f5a4d2c22bd1d2c17500fcee6a37e2754aff49
git revert --no-edit --no-commit 675ece946691185f1a2877b2880f933a417f03df
git revert --no-edit --no-commit c7f1f86ff59b739af1193df837b0aadf7a2386ce
git revert --no-edit --no-commit 815e4d86dc19e623b32366b035d027a3ffa169fa
cd $ROM_TREE

# Revert change that disables proximity check for power button
cd $ROM_TREE/frameworks/base
git revert --no-edit --no-commit 545dc46798d26328b6dc503663a771b37797eca5
cd $ROM_TREE
