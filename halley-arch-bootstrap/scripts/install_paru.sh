#!/usr/bin/env bash
set -euo pipefail

if command -v paru >/dev/null 2>&1; then
  echo "paru already installed"
  exit 0
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
cd "$tmpdir/paru"
makepkg -si --noconfirm
