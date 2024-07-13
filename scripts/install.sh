#!/bin/bash

sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf

echo "Installing AUR helper..."
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si --noconfirm
cd ..
rm -rf paru-bin

echo "Installing packages"
paru -S hyprland waybar wofi swww hyprlock noto-fonts noto-fonts-emoji alacritty mpv pavucontrol grim slurp playerctl otf-font-awesome polkit-gnome gnome-themes-extra papirus-icon-theme blueman
sudo systemctl enable bluetooth

# Thunar
./thunar.sh
clear
cd 

# Apps
paru -S --noconfirm obsidian signal-desktop syncthing keepassxc
paru -S --noconfirm librewolf-bin
clear
paru -S --noconfirm qview-git
clear
paru -S --noconfirm vscodium-bin
clear
paru -S --noconfirm nwg-look-bin

echo "Configuring Hyprland Desktop Environment..."
mkdir -p Pictures/wallpapers
mkdir -p Documents/Shared
mkdir Videos
cd hypr/
mv alacritty/ ~/.config/
mv wofi/ ~/.config/
mv wall.jpg ~/Pictures/wallpapers/
cd
#sudo rm /usr/share/hyprland/*
mv ~/hypr/hyprland.conf ~/.config/hypr/
mv ~/hypr/hyprlock.conf ~/.config/hypr/
sudo mv ~/hypr/waybar/config.jsonc /etc/xdg/waybar/
sudo mv ~/hypr/waybar/style.css /etc/xdg/waybar/
cd
clear
Hyprland
