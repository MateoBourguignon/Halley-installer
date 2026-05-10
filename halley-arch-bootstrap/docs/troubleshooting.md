# Troubleshooting

## Halley does not start

- Make sure you rebooted after changing groups.
- Check that `seatd` is enabled.
- If you are on NVIDIA, confirm `nvidia_drm` modeset is enabled.

## `paru` is missing

Install `base-devel` and `git`, then rerun the installer.

## Screen sharing does not work

Make sure the portal packages are installed and that your session is a Wayland session.
