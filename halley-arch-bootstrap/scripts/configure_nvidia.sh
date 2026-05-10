#!/usr/bin/env bash
set -euo pipefail

sudo tee /etc/modprobe.d/nvidia-wayland.conf >/dev/null <<'EOF'
options nvidia_drm modeset=1
EOF

sudo mkinitcpio -P
