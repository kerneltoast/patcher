#!/bin/bash
set -e

DEST="$(readlink -f "$(dirname "$0")")"
# Download at most once a day
[[ $(( $(date +%s) - $(stat -c %Y "$DEST/wireguard-src.patch" 2>/dev/null || echo 0) )) -gt 86400 ]] || exit 0

temp="$(mktemp -d)"
trap "rm -rf '$temp'; exit" INT TERM EXIT

[[ $(curl https://git.zx2c4.com/WireGuard/refs/) =~ snapshot/(WireGuard-[0-9.]+\.tar\.xz) ]]
curl -L "https://git.zx2c4.com/WireGuard/snapshot/${BASH_REMATCH[1]}" | tar -C "$temp" -xJf -

# Account for mega derp in latest snapshot. This should be removed whenever that isn't the most recent snapshot any more.
[[ ${BASH_REMATCH[1]} == WireGuard-0.0.20171001.tar.xz ]] && curl -L -o "$temp"/WireGuard-*/contrib/kernel-tree/create-patch.sh https://git.zx2c4.com/WireGuard/plain/contrib/kernel-tree/create-patch.sh

# Android's ancient gcc can't actually support int128 __multi3 in kernel compiles
sed -i 's/__SIZEOF_INT128__/__SIZEOF_INT128__disabled/' "$temp"/WireGuard-*/src/crypto/curve25519.c

"$temp"/WireGuard-*/contrib/kernel-tree/create-patch.sh > "$DEST/wireguard-src.patch"
exit 0
