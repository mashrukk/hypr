#!/bin/bash

# Thunar and related packages
thunar=(
    thunar 
    thunar-volman 
    tumbler
    ffmpegthumbnailer
)

# Install Thunar and related packages
for THUNAR in "${thunar[@]}"; do
    sudo pacman -S --noconfirm "$THUNAR"
done

# Check and copy configuration files if they don't exist
for DIR1 in gtk-3.0 Thunar xfce4; do
    DIRPATH=~/.config/$DIR1
    if [ ! -d "$DIRPATH" ]; then
        cp -r assets/$DIR1 ~/.config/ && echo "Copied $DIR1 config files."
    fi
done