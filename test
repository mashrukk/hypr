#!/bin/bash

sudo pacman -Syu --noconfirm thunar gvfs gvfs-mtp gvfs-gphoto2 gvfs-afc ntfs-3g

# Automatically mount drives and devices
cat <<EOF | sudo tee /etc/polkit-1/rules.d/49-thunar-mount.rules
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" && subject.isInGroup("storage")) {
        return polkit.Result.YES;
    }
});
EOF

sudo groupadd -f storage
sudo gpasswd -a "$(whoami)" storage

# Enable GVFS services
systemctl --user daemon-reload
systemctl --user start gvfs-afc-volume-monitor.service
systemctl --user start gvfs-daemon.service