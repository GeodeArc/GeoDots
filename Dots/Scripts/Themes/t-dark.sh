#!/bin/bash

wgt_theme="prefer-dark"
gtk_theme="adw-gtk3-dark"
cursor_theme="Bibata-Modern-Classic"

stlconf="$(cat $HOME/Dots/Options/style)"
style="$stlconf"

primary_monitor=$(cat "$HOME/Dots/Options/mainmonitor")
wallpaper=$(swww query | grep "^: $primary_monitor:" | sed 's/.*image: //')
genwal=$wallpaper

gsettings set org.gnome.desktop.interface color-scheme "$wgt_theme"
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"
echo -e "\$cursortheme = $cursor_theme" > $HOME/.config/hypr/config/cursortheme.conf

echo "dark" > $HOME/Dots/Options/theme
cp -a $HOME/.config/waybar/$style/dark/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/$style/dark/. $HOME/.config/swaync/
cp -a $HOME/.config/swayosd/$style/dark.css $HOME/.config/swayosd/style.css
cp -a $HOME/.config/rofi/$style/dark/config.rasi $HOME/.config/rofi/
cp -a $HOME/.config/eww/dark/eww.scss $HOME/.config/eww/
cp -a $HOME/.config/starship/dark/starship.toml $HOME/.config/
cp -a $HOME/.config/hypr/themes/$style/dark/hyprlock.conf $HOME/.config/hypr/

wal -q -i $genwal &

sleep 0.5 

killall waybar
pkill swayosd
waybar &
swayosd-server &

swaync-client -R
swaync-client -rs

eww reload

sleep 0.5
