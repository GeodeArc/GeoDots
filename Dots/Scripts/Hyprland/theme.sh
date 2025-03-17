#!/bin/bash

while true; do    
    echo "Light theme or dark theme? [L/D]"
    read -p " ■ " lightordark
    
    case "$lightordark" in
        [Ll]) 
        theme="prefer-light"
        gtk_theme="adw-gtk3" 
        type="light"
        ;;
        [Dd]) 
        theme="prefer-dark"
        gtk_theme="adw-gtk3-dark"
        type="dark"
        ;;
        *) 
        clear
        echo "X Please try again."
        echo ""
        continue
        ;;
    esac
    
    echo "Setting $theme theme"
    gsettings set org.gnome.desktop.interface color-scheme "$theme"
    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
    echo "$type" > $HOME/Dots/Options/theme
    echo "main" > $HOME/.config/waybar/type   
    cp -a $HOME/.config/waybar/configs/$type/. $HOME/.config/waybar/
    cp -a $HOME/.config/swaync/themes/$type/. $HOME/.config/swaync/
    cp -a $HOME/.config/rofi/options/$type/. $HOME/.config/rofi/
	killall waybar
	nohup waybar &
    sleep 0.5
    clear
    echo "Theme successfully installed!"
    echo "If some areas dont seem correctly themed, try rebooting. If that didnt work for you, there may be a theme conflict somewhere."
    echo ""
    read -p "Press ENTER to exit"
    exit 0
done
