#!/bin/bash

while true; do
    echo "What would you like to do?"
    echo ""
    echo "1. See keybinds"
    echo "2. Change your theme"
    echo "3. Setup Monitors (unfinished)"
    echo "4. Setup Hyprlock (unfinished)"
    echo "5. Update (unfinished)"
    echo "6. Leave"
    echo ""
    read -p " ■ " choice

    case $choice in
        1)
            kitty less $HOME/Dots/Options/defaultbinds
            clear
            ;;
        2)
        	clear
            bash $HOME/Dots/Scripts/Hyprland/theme.sh
            clear
            ;;
        3)
        	clear
            bash $HOME/Dots/Scripts/Hyprland/monitors.sh
            clear
            ;;
        4)
        	clear
            bash $HOME/Dots/Scripts/Hyprland/hyprlock.sh    
            clear
            ;;
        5)
        	clear
            bash $HOME/Dots/Scripts/Hyprland/update.sh    
            clear
            ;;
        6)
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
