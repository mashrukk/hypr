#!/bin/bash

mv ~/hypr/alacritty ~/.config/
mv ~/hypr/wofi ~/.config/
mkdir -p ~/Pictures/wallpapers/
mkdir -p ~/Pictures/Screenshots/
mkdir -p ~/Documents/Shared/
mv ~/hypr/wall.jpg ~/Pictures/wallpapers/
mv ~/hypr/hyprland.conf ~/.config/hypr/
mv ~/hypr/hyprlock.conf ~/.config/hypr/
sudo mv ~/hypr/waybar/config.jsonc /etc/xdg/waybar/
sudo mv ~/hypr/waybar/style.css /etc/xdg/waybar/
cd ~/hypr/scripts
rm install.sh thunar.sh post.sh
xdg-settings set default-web-browser librewolf.desktop
mkdir -p ~/.local/share/icons/
curl -L -o ~/.local/share/icons/Bibata_Cursor.tar.gz https://github.com/ful1e5/Bibata_Cursor/archive/v2.0.7.tar.gz
cd ~/.local/share/icons
tar -xvf Bibata_Cursor.tar.gz
rm Bibata_Cursor.tar.gz
cd
clear
Hyprland
