#!/bin/bash

mkdir -p ~/Pictures/wallpapers/
mkdir -p ~/Pictures/Screenshots/
mkdir -p ~/Documents/Shared/
mkdir -p ~/.local/share/icons/
mv ~/hypr/cursor ~/.local/share/icons/
mv ~/hypr/alacritty ~/.config/
mv ~/hypr/wofi ~/.config/
mv ~/hypr/wall.jpg ~/Pictures/wallpapers/
mv ~/hypr/hyprland.conf ~/.config/hypr/
mv ~/hypr/hyprlock.conf ~/.config/hypr/
sudo mv ~/hypr/waybar/config.jsonc /etc/xdg/waybar/
sudo mv ~/hypr/waybar/style.css /etc/xdg/waybar/
cd ~/hypr/scripts
rm install.sh thunar.sh post.sh
xdg-settings set default-web-browser librewolf.desktop
cd
clear
Hyprland
