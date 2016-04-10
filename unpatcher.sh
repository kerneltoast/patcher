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

# packages/apps/Settings:
cd ../../packages/apps/Settings
git reset --hard
git clean -f -d

# system/core:
cd ../../../system/core
git reset --hard
git clean -f -d

# vendor/cm:
cd ../../vendor/cm
git reset --hard
git clean -f -d

# vendor/cmsdk:
cd ../../vendor/cmsdk
git reset --hard
git clean -f -d

cd ../..
