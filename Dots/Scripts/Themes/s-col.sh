#!/bin/bash

thmconf="$(cat $HOME/Dots/Options/theme)"
theme="$thmconf"

echo "colorful" > $HOME/Dots/Options/style
cp -a $HOME/.config/waybar/colorful/$theme/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/colorful/$theme/. $HOME/.config/swaync/
cp -a $HOME/.config/swayosd/colorful/$theme.css $HOME/.config/swayosd/style.css
cp -a $HOME/.config/rofi/colorful/$theme/config.rasi $HOME/.config/rofi/
cp -a $HOME/.config/hypr/themes/colorful/theme.conf $HOME/.config/hypr/
cp -a $HOME/.config/hypr/themes/colorful/$theme/hyprlock.conf $HOME/.config/hypr/

sleep 0.5 

killall waybar
pkill swayosd
waybar &
swayosd-server &

swaync-client -R
swaync-client -rs

hyprctl reload

sleep 0.5
