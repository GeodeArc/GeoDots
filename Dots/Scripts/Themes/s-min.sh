#!/bin/bash

thmconf="$(cat $HOME/Dots/Options/theme)"
theme="$thmconf"

echo "minimal" > $HOME/Dots/Options/style
cp -a $HOME/.config/waybar/minimal/$theme/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/minimal/$theme/. $HOME/.config/swaync/
cp -a $HOME/.config/rofi/minimal/$theme/config.rasi $HOME/.config/rofi/
cp -a $HOME/.config/hypr/themes/minimal/theme.conf $HOME/.config/hypr/
cp -a $HOME/.config/hypr/themes/minimal/$theme/hyprlock.conf $HOME/.config/hypr/

sleep 0.5 

killall waybar
waybar &

swaync-client -R
swaync-client -rs

hyprctl reload

sleep 0.5
