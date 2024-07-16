#!/bin/bash

thunar_packages=(
    thunar
    thunar-volman
    tumbler
    ffmpegthumbnailer
    udisks2
)

# Check if a package is already installed
check_package_installed() {
    pacman -Q "$1" &>/dev/null
}

# Install packages if not already installed
for package in "${thunar_packages[@]}"; do
    if ! check_package_installed "$package"; then
        sudo pacman -S --noconfirm "$package"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install $package."
            exit 1
        fi
    else
        echo "$package is already installed."
    fi
done

# Check if udisks2 service is running
if ! systemctl is-active --quiet udisks2; then
    echo "udisks2 service is not running. Starting udisks2..."
    sudo systemctl start udisks2
fi

# Thunar volume management rules setup function
setup_thunar_volman_rules() {
    local volman_config_path=~/.config/Thunar/uca.xml
    local assets_dir="$(dirname "$0")/assets"  # Assuming assets folder is in the same directory as this script

    if [ ! -f "$volman_config_path" ]; then
        mkdir -p ~/.config/Thunar  # Ensure Thunar config directory exists
        cp "$assets_dir/uca.xml" "$volman_config_path"
        sed -i 's|<mount>udisks2://|<mount>|g' "$volman_config_path"  # Use udisks2 for mounting
    else
        echo "Thunar Volume Management rules already exist, no need to set up."
    fi
}

setup_thunar_volman_rules

echo "Thunar and essential related packages installed and configured successfully."

