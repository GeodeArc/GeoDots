#!/bin/bash

monitor=$(cat $HOME/Dots/Options/mainmonitor)
cache_file="$HOME/.cache/swww/$monitor"
wallpaper=$(grep -v "^Lanczos3" "$cache_file")
genwal=$wallpaper

echo "Updating SDDM wallpaper... "

if ! pacman -Q ffmpeg &>/dev/null; then
   sudo pacman -S --needed ffmpeg
fi 

sudo rm -r /usr/share/sddm/themes/win11-sddm-theme/Backgrounds/wallpaper.jpg
sudo rm -r /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/wallpaper.jpg
sudo ffmpeg -i $genwal /usr/share/sddm/themes/win11-sddm-theme/Backgrounds/wallpaper.jpg
sudo ffmpeg -i $genwal /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/wallpaper.jpg

clear

echo "The SDDM wallpaper has been updated to your current wallpaper"
