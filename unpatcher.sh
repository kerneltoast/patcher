#!/bin/sh

# Remove previously-applied patches

# build:
cd build
git reset --hard
git clean -f -d

# frameworks/av:
cd ../frameworks/av
git reset --hard
git clean -f -d

# frameworks/base:
cd ../../frameworks/base
git reset --hard
git clean -f -d

# packages/apps/LockClock:
cd ../../packages/apps/LockClock
git reset --hard
git clean -f -d

# packages/apps/Trebuchet:
cd ../../../packages/apps/Trebuchet
git reset --hard
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
git clean -f -d

cd ../..
