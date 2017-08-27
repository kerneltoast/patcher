#!/bin/sh

ROM_TREE=$PWD

# Clean up
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/qcom/display-caf/msm8974
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Dialer
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Gallery2
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE
