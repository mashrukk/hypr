#!/bin/bash

mkdir -p ~/Pictures/Wallpapers/
mkdir -p ~/Pictures/Screenshots/
mkdir ~/Downloads
mkdir ~/Videos
mkdir -p ~/Documents/Shared/
mkdir -p ~/.local/share/icons/
mv ~/hypr/cursor ~/.local/share/icons/
mv ~/hypr/alacritty ~/.config/
mv ~/hypr/wofi ~/.config/
mv ~/hypr/wall.jpg ~/Pictures/Wallpapers/
mv ~/hypr/hyprland.conf ~/.config/hypr/
mv ~/hypr/hyprlock.conf ~/.config/hypr/
sudo mv ~/hypr/waybar/* /etc/xdg/waybar/
rm -rf ~/hypr/waybar
cd ~/hypr/scripts
rm install.sh thunar.sh post.sh
xdg-settings set default-web-browser librewolf.desktop
cd
clear
Hyprland
