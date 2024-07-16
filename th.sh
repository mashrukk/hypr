#!/bin/bash

# Install gvfs for automounting support
sudo pacman -S --noconfirm gvfs

# Enable and start GVFS services for user session
systemctl --user enable --now gvfs-udisks2-volume-monitor.service
systemctl --user enable --now gvfs-goa-volume-monitor.service