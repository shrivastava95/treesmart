#!/usr/bin/env bash
set -e

readonly DEST="$HOME/.local/bin"

if command -v tput > /dev/null; then
    readonly GREEN=$(tput setaf 2)
    readonly RESET=$(tput sgr0)
fi

echo "Installing treesmart..."

mkdir -p "$DEST"
curl -fsSL https://raw.githubusercontent.com/shrivastava95/treesmart/main/treesmart/treesmart.sh \
    -o "$DEST/treesmart"
chmod 755 "$DEST/treesmart"

echo "${GREEN}Installation finished${RESET}"
echo "Make sure $DEST is in your PATH"

