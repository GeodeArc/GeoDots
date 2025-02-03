#!/bin/bash

monitor=$(cat $HOME/Dots/Options/mainmonitor)

sleep 1.5

cache_file="$HOME/.cache/swww/$monitor"
wallpaper=$(grep -v "^Lanczos3" "$cache_file")

genwal=$wallpaper
echo "* { wallpaper: url(\"$genwal\", width); }" > "$HOME/.config/rofi/wallpaper.rasi"

wal -q -i $genwal

sleep 0.1

$HOME/Dots/Scripts/Waybar/waybar.sh

swaync-client -R
swaync-client -rs

#pywalfox update
