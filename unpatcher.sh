#!/bin/sh

ROM_TREE=$PWD

# Clean up
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
cd $ROM_TREE/packages/apps/Eleven
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
