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
    cp -a $HOME/.config/waybar/configs/$type/. $HOME/GeoDots/.config/waybar/
    cp -a $HOME/.config/swaync/themes/$type/. $HOME/GeoDots/.config/swaync/
    cp -a $HOME/.config/rofi/options/$type/. $HOME/GeoDots/.config/rofi/
    clear
    echo "Theme successfully installed!"
    echo "A reboot is usually needed to ensure everything is correctly themed."
    echo ""
    read -p "Press ENTER to restart now, otherwise press CTRL+C to restart later."
    reboot
done
