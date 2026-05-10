# Halley Arch Bootstrap

This repo automates a conservative Arch Linux setup for Halley with GPU detection, seat management, Rust, paru, and the Wayland basics.

## What it does

- Detects NVIDIA, AMD, or Intel graphics
- Installs the matching driver stack
- Installs `seatd` for libseat-based seat management
- Installs Rust and `paru`
- Installs Halley and the common Wayland tools from AUR / pacman
- Enables the needed services
- Writes a small local state file so reruns are safe

## Usage

Run this from a fresh Arch install after the base system is up:

```bash
git clone https://github.com/MateoBourguignon/halley-arch-bootstrap.git
```
```bash
cd halley-arch-bootstrap
```
```bash
chmod +x install.sh scripts/*.sh
```
```bash
./install.sh
```
## Notes

- The repo intentionally avoids inventing Halley configuration syntax.
- It installs the compositor and supporting tools, then leaves `~/.config/halley/` for you to customize.
- If you use NVIDIA, it enables DRM modesetting and rebuilds initramfs.

## Safety checks

The scripts are written to fail fast and print each step before running it.
