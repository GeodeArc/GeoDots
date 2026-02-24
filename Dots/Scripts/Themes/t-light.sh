#!/bin/bash

wgt_theme="prefer-light"
gtk_theme="adw-gtk3"
cursor_theme="Bibata-Modern-Ice"

stlconf="$(cat $HOME/Dots/Options/style)"
style="$stlconf"

primary_monitor=$(cat "$HOME/Dots/Options/mainmonitor")
wallpaper=$(swww query | grep "^: $primary_monitor:" | sed 's/.*image: //')
genwal=$wallpaper

gsettings set org.gnome.desktop.interface color-scheme "$wgt_theme"
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"
echo -e "\$cursortheme = $cursor_theme" > $HOME/.config/hypr/config/cursortheme.conf

echo "light" > $HOME/Dots/Options/theme
cp -a $HOME/.config/waybar/$style/light/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/$style/light/. $HOME/.config/swaync/
cp -a $HOME/.config/swayosd/$style/light.css $HOME/.config/swayosd/style.css
cp -a $HOME/.config/rofi/$style/light/config.rasi $HOME/.config/rofi/
cp -a $HOME/.config/eww/light/eww.scss $HOME/.config/eww/
cp -a $HOME/.config/hypr/themes/$style/light/hyprlock.conf $HOME/.config/hypr/

wal -q -l -i $genwal &

sleep 0.5 

killall waybar
pkill swayosd
waybar &
swayosd-server &

swaync-client -R
swaync-client -rs

eww reload

sleep 0.5
