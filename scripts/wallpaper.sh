#!/bin/bash

# Path to your wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using swww
swww img "$WALLPAPER"
