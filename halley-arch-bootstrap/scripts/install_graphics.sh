#!/usr/bin/env bash
set -euo pipefail

gpu="${1:-unknown}"

case "$gpu" in
  nvidia)
    sudo pacman -S --noconfirm nvidia-dkms linux-headers
    ;;
  amd)
    sudo pacman -S --noconfirm mesa vulkan-radeon
    ;;
  intel)
    sudo pacman -S --noconfirm mesa vulkan-intel
    ;;
  unknown)
    sudo pacman -S --noconfirm mesa
    ;;
  *)
    echo "Unknown GPU profile: $gpu" >&2
    exit 1
    ;;
esac
