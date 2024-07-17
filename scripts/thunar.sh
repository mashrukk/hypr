#!/bin/bash

thunar_packages=(
    thunar
    thunar-volman
    tumbler
    ffmpegthumbnailer
    gvfs
    gvfs-mtp
    ntfs-3g
)

for package in "${thunar_packages[@]}"; do
    sudo pacman -S --noconfirm "$package"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install $package."
        exit 1
    fi
done

# Check if gvfs is running
if ! pgrep -x "gvfsd" >/dev/null; then
    echo "gvfs is not running. Please ensure it is started for proper Thunar functionality."
fi

# Thunar volume management rules
setup_thunar_volman_rules() {
    local volman_config_path=~/.config/Thunar/uca.xml
    if [ ! -f "$volman_config_path" ]; then
        echo "Setting up Thunar Volume Management rules..."
        cp assets/uca.xml ~/.config/Thunar/
        echo "Thunar Volume Management rules set up successfully."
    else
        echo "Thunar Volume Management rules already exist, no need to set up."
    fi
}

setup_thunar_volman_rules

mkdir -p /media/drive

echo "Available drives:"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,UUID

read -p "Enter the drive name (e.g., sdb): " drive_name

# Get UUID of the selected drive
uuid=$(lsblk -no UUID /dev/"$drive_name")

if [ -z "$uuid" ]; then
  echo "UUID not found for /dev/$drive_name"
  exit 1
fi

# Set mount point and filesystem type
mount_point="/media/drive"
filesystem_type="auto"
options="defaults"

# Add entry to /etc/fstab
echo "UUID=$uuid $mount_point $filesystem_type $options 0 0" | sudo tee -a /etc/fstab

tail -n 1 /etc/fstab

sudo mount -a

echo "Thunar and essential related packages installed and configured successfully."
