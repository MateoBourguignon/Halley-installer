#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="${HOME}/.local/state/halley-arch-bootstrap"
mkdir -p "$STATE_DIR"

log() { printf '\n==> %s\n' "$*"; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

need_cmd pacman
need_cmd sudo

log "Refreshing package databases"
sudo pacman -Syu --noconfirm

log "Installing base dependencies"
sudo pacman -S --noconfirm git base-devel rustup seatd

log "Detecting GPU"
GPU="$("$SCRIPT_DIR/scripts/detect_gpu.sh")"
echo "$GPU" | tee "$STATE_DIR/gpu.txt" >/dev/null
echo "Detected GPU: $GPU"

log "Installing graphics stack"
"$SCRIPT_DIR/scripts/install_graphics.sh" "$GPU"

log "Installing paru"
"$SCRIPT_DIR/scripts/install_paru.sh"

log "Installing Halley and Wayland tools"
"$SCRIPT_DIR/scripts/install_halley.sh"

log "Enabling services"
"$SCRIPT_DIR/scripts/enable_services.sh"

if [[ "$GPU" == "nvidia" ]]; then
  log "Applying NVIDIA Wayland configuration"
  "$SCRIPT_DIR/scripts/configure_nvidia.sh"
fi

log "Done"
echo "Log out and back in after any group changes. A reboot is recommended."
