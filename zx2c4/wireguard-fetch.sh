#!/bin/bash
set -e

DEST="$(readlink -f "$(dirname "$0")")"
# Download at most once a day
[[ $(( $(date +%s) - $(stat -c %Y "$DEST/wireguard-src.patch" 2>/dev/null || echo 0) )) -gt 86400 ]] || exit 0

temp="$(mktemp -d)"
trap "rm -rf '$temp'; exit" INT TERM EXIT

[[ $(curl https://git.zx2c4.com/WireGuard/refs/) =~ snapshot/(WireGuard-[0-9.]+\.tar\.xz) ]]
curl "https://git.zx2c4.com/WireGuard/snapshot/${BASH_REMATCH[1]}" | tar -C "$temp" -xJf -

"$temp"/WireGuard-*/contrib/kernel-tree/create-patch.sh > "$DEST/wireguard-src.patch"
exit 0
