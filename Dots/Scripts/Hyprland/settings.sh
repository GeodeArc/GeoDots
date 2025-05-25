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
    echo "-------------------------------------------------------"
    echo "1. Get started with GeoDots                           "
    echo "2. See Default Keybinds                               󰌌"
    echo "-------------------------------------------------------"
    echo "4. Customize Dotfiles             (Unfinished)        "
    echo "3. Hardware Configuration         (Unfinished)        󰍺"
    echo "-------------------------------------------------------"
    echo "8. Upgrade Dotfiles               (Unfinished)        "
    echo "8. Remove Dotfiles                (Unfinished)        󱔌"
    echo "-------------------------------------------------------"
    echo "9. Leave                                              󰈆"
    echo "-------------------------------------------------------"
    echo ""
    read -p " ■ " choice

    case $choice in
        1)
            clear
            less $HOME/Dots/Guide/getting-started
            clear
            ;;
        2)
            clear
            less $HOME/Dots/Guide/default-binds
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
