#!/bin/sh

# Remove previously-applied patches

# frameworks/base:
cd frameworks/base
git reset --hard
git clean -f -d
cd ../..
