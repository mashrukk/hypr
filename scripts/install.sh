#!/bin/bash

sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf

echo "Installing AUR helper..."
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si --noconfirm
cd ..
rm -rf paru-bin

echo "Installing packages"
paru -S hyprland waybar wofi swww hyprlock xdg-desktop-portal-hyprland noto-fonts noto-fonts-emoji alacritty mpv pulsemixer grim slurp playerctl otf-font-awesome polkit-gnome gnome-themes-extra papirus-icon-theme blueman fastfetch btop
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

fastfetch
