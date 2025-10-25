#!/bin/bash

theme="prefer-dark"
gtk_theme="adw-gtk3-dark"
cursor_theme="Bibata-Modern-Classic"

stlconf="$(cat $HOME/Dots/Options/style)"
style="$stlconf"

gsettings set org.gnome.desktop.interface color-scheme "$wgt_theme"
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"
echo -e "\$cursortheme = $cursor_theme" > $HOME/.config/hypr/config/cursortheme.conf

echo "dark" > $HOME/Dots/Options/theme
cp -a $HOME/.config/waybar/$style/dark/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/$style/dark/. $HOME/.config/swaync/
cp -a $HOME/.config/rofi/$style/dark/config.rasi $HOME/.config/rofi/

sleep 0.5 

killall waybar
waybar &

swaync-client -R
swaync-client -rs

sleep 0.5
