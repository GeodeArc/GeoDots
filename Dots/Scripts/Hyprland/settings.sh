#!/bin/bash

clear

while true; do
    echo ".dP888 888888 888888 888888 88 88b  88  dPPbb8  .dP888 "
    echo "Ybo.   88       88     88   88 88Yb 88 dP        Ybo.  "
    echo " Y8b   888888   88     88   88 88 Yb88 Yb   88b   Y8b  "
    echo "   Y8o 88       88     88   88 88  YY8 Yb   P8     Y8o "
    echo "8bodP  888888   88     88   88 88   Y8  YoodP   8bodP  "
    echo ""
    echo "What would you like to do?"
    echo ""
    echo "1. See keybinds                                       󰌌"
    echo "2. Change your theme                                  󰔎"
    echo "3. Monitors Configuration         (Unfinished)        󰍺"
    echo "4. Lock Screen Customization      (Unfinished)        "
    echo "5. Bar Customization              (Unfinished)        󰘔"
    echo "6. Menus Customization            (Unfinished)        󰹯"
    echo "7. Sidebar/Notif Customization    (Unfinished)        "
    echo "8. Upgrade Dotfiles               (Unfinished)        󰚰"
    echo "9. Leave                                              󰈆"
    echo ""
    read -p " ■ " choice

    case $choice in
        1)
            clear
            less $HOME/Dots/Options/defaultbinds
            clear
            ;;
        2)
        	clear
            $HOME/Dots/Scripts/Hyprland/theme.sh
            clear
            ;;
        3)
        	clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh
            clear
            ;;
        4)
        	clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh    
            clear
            ;;
        5)
        	clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh    
            clear
            ;;
        6)
        	clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh    
            clear
            ;;
        7)
            clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh    
            clear
            ;;
        8)
        	clear
            $HOME/Dots/Scripts/Hyprland/placeholder.sh    
            clear
            ;;
        9)
        	echo "Bye bye!"
        	exit 0
            ;;
        *)
            clear
            echo "X Please try again."
            echo ""
            ;;
    esac
done