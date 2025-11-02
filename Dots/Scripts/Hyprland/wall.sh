#!/bin/bash

sleep 1

primary_monitor=$(cat "$HOME/Dots/Options/mainmonitor")
wallpaper=$(swww query | grep "^: $primary_monitor:" | sed 's/.*image: //')

genwal=$wallpaper
wallname=$(echo $genwal | sed 's/.*\///')

rm $HOME/Dots/Options/wallpaper
ln -s $genwal $HOME/Dots/Options/wallpaper
echo "* { wallpaper: url(\"$genwal\", width); }" > "$HOME/.config/rofi/options/wallpaper.rasi"

wal -q -i $genwal &
$HOME/Dots/Scripts/Waybar/waybar.sh &

sleep 0.5

notify-send -i preferences-desktop-wallpaper-symbolic "Wallpaper Applied" "New color scheme generated from image:\n$wallname"

swaync-client -R
swaync-client -rs

eww reload