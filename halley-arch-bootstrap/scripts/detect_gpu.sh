#!/usr/bin/env bash
set -euo pipefail

if command -v lspci >/dev/null 2>&1; then
  if lspci | grep -qi nvidia; then
    echo "nvidia"
    exit 0
  fi
  if lspci | grep -Eqi 'amd|advanced micro devices|radeon'; then
    echo "amd"
    exit 0
  fi
  if lspci | grep -qi intel; then
    echo "intel"
    exit 0
  fi
fi

echo "unknown"
