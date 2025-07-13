#!/bin/bash

cp -a $HOME/.config/waybar/configs/minimal/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/themes/minimal/. $HOME/.config/swaync/
cp -a $HOME/.config/rofi/options/minimal/. $HOME/.config/rofi/
cp -a $HOME/.config/hypr/themes/game/hyprland.conf $HOME/.config/hypr/

sleep 0.5 

killall waybar
waybar &

swaync-client -R
swaync-client -rs

sleep 0.5
