#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
BRANCH=$PATCHER_PATH/ZNH5Y
CUSTOM=$PATCHER_PATH/sultan

SECURITY=$ROM_TREE/patcher/ZNH5Y/security
SECURITY_JAN17=$SECURITY/2017-01-01
SECURITY_FEB17=$SECURITY/2017-02-01
SECURITY_MAR17=$SECURITY/2017-03-01

APN_LIST_URL=https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-13.0/prebuilt/common/etc/apns-conf.xml

# Clean up first
cd $ROM_TREE/bionic
git clean -f -d && git reset --hard
cd $ROM_TREE/bootable/recovery
git clean -f -d && git reset --hard
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/external/boringssl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libavc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libhevc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnfc-nci
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libopus
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libvpx
git clean -f -d && git reset --hard
cd $ROM_TREE/external/tremolo
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/ex
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/opt/net/wifi
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/libhardware
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Bluetooth
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/CertInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/PackageInstaller
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/UnifiedEmail
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cmsdk
git clean -f -d && git reset --hard

cd $ROM_TREE

# Prebuilt Gello APK
rm -rf ~/.m2/repository/org/cyanogenmod/gello
mkdir -p ~/.m2/repository/org/cyanogenmod
cp -R $PATCHER_PATH/gello ~/.m2/repository/org/cyanogenmod

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
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base6.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-native0.patch
patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-LockClock0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings2.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings3.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/system-core2.patch

# Get APN list from nightly branch and apply patch on top
curl -s $APN_LIST_URL > vendor/cm/prebuilt/common/etc/apns-conf.xml

### Security patches
# 2017-01-01
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/build0.patch
patch -d external/libhevc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libhevc0.patch
patch -d external/libnl				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libnl0.patch
patch -d external/libopus			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libopus0.patch
patch -d external/libvpx			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libvpx0.patch
patch -d external/tremolo			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-tremolo0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av1.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av3.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av4.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av5.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-base0.patch
patch -d frameworks/ex				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-ex0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-native0.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/packages-services-Telephony0.patch

# 2017-02-01
patch -d bionic					-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/bionic0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/build0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-base1.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-native0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-native1.patch
patch -d hardware/libhardware			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/hardware-libhardware0.patch
patch -d packages/apps/Bluetooth		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Bluetooth0.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging0.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging1.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging2.patch
patch -d packages/apps/UnifiedEmail		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-UnifiedEmail0.patch
patch -d vendor/cmsdk				-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/vendor-cmsdk0.patch

# 2017-03-01
patch -d bootable/recovery			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/bootable-recovery0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/build0.patch
patch -d external/boringssl			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-boringssl0.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc0.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc1.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc2.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc3.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc4.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc5.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc6.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc7.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc8.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc9.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc10.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc11.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc12.patch
patch -d external/libavc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libavc13.patch
patch -d external/libhevc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libhevc0.patch
patch -d external/libnfc-nci			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/external-libnfc-nci0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-av0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-av1.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-av2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-av3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-base2.patch
patch -d frameworks/ex				-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-ex0.patch
patch -d frameworks/opt/net/wifi		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/frameworks-opt-net-wifi0.patch
patch -d packages/apps/CertInstaller		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/packages-apps-CertInstaller0.patch
patch -d packages/apps/CertInstaller		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/packages-apps-CertInstaller1.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/packages-apps-Messaging0.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/packages-apps-Messaging1.patch
patch -d packages/apps/PackageInstaller		-p1 -s -N --no-backup-if-mismatch < $SECURITY_MAR17/packages-apps-PackageInstaller0.patch
