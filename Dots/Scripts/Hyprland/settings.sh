#!/bin/bash

clear

customization() {
    while true; do
        echo "CUSTOMIZE DOTFILES"
        echo "Configure software included with these Dotfiles"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "7. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice
    done
}

hardware() {
    while true; do
        echo "HARDWARE SETTINGS"
        echo "Change Hardware settings (such as Monitors, Keyboard Layout, Sensitivity etc)"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "7. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice
    done
}


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
    echo "3. Customize Dotfiles             (Unfinished)        "
    echo "4. Hardware Configuration         (Unfinished)        󰍺"
    echo "-------------------------------------------------------"
    echo "5. Upgrade Dotfiles               (Unfinished)        "
    echo "6. Remove Dotfiles                                    󱔌"
    echo "-------------------------------------------------------"
    echo "Q. Leave                                              󰈆"
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
            customization
            clear
            ;;
        4)
        	clear
            hardware
            clear
            ;;
        5)
        	clear
            echo "Getting update information, please wait.."
            $HOME/Dots/Scripts/Hyprland/dotsupgrade.sh    
            clear
            ;;
        6)
      	  	clear
            echo "Getting package list, please wait.."
            $HOME/Dots/Scripts/Hyprland/dotsremove.sh    
            clear
            ;;
        [qQ])
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