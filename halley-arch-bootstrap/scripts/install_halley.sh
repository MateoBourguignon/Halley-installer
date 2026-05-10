#!/usr/bin/env bash
set -euo pipefail

if ! command -v paru >/dev/null 2>&1; then
  echo "paru is required first" >&2
  exit 1
fi

paru -S --noconfirm   halley-git   xwayland-satellite-git   fuzzel   wezterm   xdg-desktop-portal-wlr   xdg-desktop-portal-gtk   slurp
