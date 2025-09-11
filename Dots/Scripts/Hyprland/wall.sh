#!/bin/bash

sleep 1

monitor=$(cat $HOME/Dots/Options/mainmonitor)
cache_file="$HOME/.cache/swww/$monitor"
wallpaper=$(grep -v "^Lanczos3" "$cache_file")
genwal=$wallpaper
wallname=$(echo $genwal | sed 's/.*\///')

rm $HOME/Dots/Options/wallpaper
ln -s $genwal $HOME/Dots/Options/wallpaper
echo "* { wallpaper: url(\"$genwal\", width); }" > "$HOME/.config/rofi/options/wallpaper.rasi"

wal -q -i $genwal &
swaync-client -R
swaync-client -rs
$HOME/Dots/Scripts/Waybar/waybar.sh &

notify-send -i preferences-desktop-wallpaper-symbolic "Wallpaper Applied" "New color scheme generated from image:\n$wallname"