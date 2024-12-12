#!/bin/bash

libthemeenable() {
    echo ""
    echo " Installing Required Files (SUDO required): "
    sudo pacman -S --needed xdg-desktop-portal-gnome
    echo ""
    echo " Setting Theme (Restart usually required for any changes)"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    echo " Done!"
}

while true; do
    clear
    read -p 'Enable Libadwaita Dark Theme (!recommended!) [Y OR N]? ' libtheme

    case $libtheme in
        y)
            libthemeenable
            break
            ;;
        Y)
            libthemeenable
            break
            ;;
        n)
            echo "Skipping!"
            break
            ;;
        N)
            echo "Skipping!"
            break
            ;;
        *)
 	        echo "Invalid choice. Please try again."
            sleep 1
            ;;
    esac
done