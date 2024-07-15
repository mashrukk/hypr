#!/bin/bash

cd
mv ~/hypr/alacritty ~/.config/
mv ~/hypr/wofi ~/.config/
mkdir -p ~/Pictures/wallpapers/
mkdir -p ~/Documents/Shared/
mv ~/hypr/wall.jpg ~/Pictures/wallpapers/
sudo rm /usr/share/hyprland/*
mv ~/hypr/hyprland.conf ~/.config/hypr/
mv ~/hypr/hyprlock.conf ~/.config/hypr/
sudo mv ~/hypr/waybar/config.jsonc /etc/xdg/waybar/
sudo mv ~/hypr/waybar/style.css /etc/xdg/waybar/
clear
Hyprland
