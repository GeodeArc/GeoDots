#!/bin/bash

monitor=$(cat $HOME/Dots/Options/mainmonitor)

sleep 1.5

cache_file="$HOME/.cache/swww/$monitor"
wallpaper=$(grep -v "^Lanczos3" "$cache_file")

genwal=$wallpaper
rm $HOME/Dots/Options/wallpaper
ln -s $genwal $HOME/Dots/Options/wallpaper

echo "* { wallpaper: url(\"$genwal\", width); }" > "$HOME/.config/rofi/options/wallpaper.rasi"

wal -q -i $genwal
swaync-client -R
swaync-client -rs

sleep 0.5

$HOME/Dots/Scripts/Waybar/waybar.sh

#pywalfox update
