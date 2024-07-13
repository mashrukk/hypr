#!/bin/bash

cd
sudo rm /usr/share/hyprland/*

mv ~/hypr/hyprland.conf ~/.config/hypr/

mv ~/hypr/hyprlock.conf ~/.config/hypr/

sudo mv ~/hypr/waybar/config.jsonc /etc/xdg/waybar/

sudo mv ~/hypr/waybar/style.css /etc/xdg/waybar/

cd

clear

Hyprland
