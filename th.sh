#!/bin/bash

# Update repositories and install necessary packages
sudo pacman -Syu --noconfirm thunar gvfs gvfs-mtp gvfs-gphoto2 ntfs-3g

# Configure Thunar to automatically mount drives and devices
cat <<EOF | sudo tee /etc/polkit-1/rules.d/49-thunar-mount.rules
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" && subject.isInGroup("storage")) {
        return polkit.Result.YES;
    }
});
EOF

# Add user to 'storage' group to allow mounting
sudo groupadd -f storage
sudo gpasswd -a "$(whoami)" storage

# Enable and start GVFS services for automounting
systemctl --user daemon-reload
systemctl --user start gvfs-udisks2-volume-monitor.service
systemctl --user start gvfs-gphoto2-volume-monitor.service
systemctl --user start gvfs-mtp-volume-monitor.service