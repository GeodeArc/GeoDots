#!/bin/bash

thmconf="$(cat $HOME/Dots/Options/theme)"
theme="$thmconf"

echo "modern" > $HOME/Dots/Options/style
cp -a $HOME/.config/waybar/modern/$theme/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/modern/$theme/. $HOME/.config/swaync/
cp -a $HOME/.config/rofi/modern/$theme/config.rasi $HOME/.config/rofi/

sleep 0.5 

killall waybar
waybar &

swaync-client -R
swaync-client -rs

hyprctl reload

sleep 0.5
