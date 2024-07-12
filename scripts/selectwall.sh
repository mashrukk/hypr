#!/bin/bash

# Define the wallpaper directory
WALLPAPER_DIR=~/Pictures/wallpapers

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Directory $WALLPAPER_DIR does not exist."
  exit 1
fi

# List all image files in the wallpaper directory and extract the file names
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | sed "s|$WALLPAPER_DIR/||" | sort)

# Check if there are any wallpapers
if [ -z "$wallpapers" ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Show the list with wofi
selected_file=$(echo "$wallpapers" | wofi --dmenu \
  --title "Select Wallpaper" \
  --prompt "Choose a wallpaper:" \
  --width 10% \
  --height 10% \
  --lines 10 \
  --hide-scrollbar)

# Check if a file was selected
if [ -n "$selected_file" ]; then
  # Construct the full path to the selected wallpaper
  selected_wallpaper="$WALLPAPER_DIR/$selected_file"
  # Set the selected wallpaper using swww
  swww img "$selected_wallpaper"
  echo "Wallpaper set to $selected_wallpaper"
else
  echo "No wallpaper selected."
fi

