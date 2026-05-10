#!/usr/bin/env bash
set -euo pipefail

sudo systemctl enable --now seatd
sudo usermod -aG seat,video,render "$USER" || true
