#!/bin/bash

# TO DO: 
# Allow different editors from nano (neovim, user specified during setup)
# Actually complete everything
# Make things more complex (e.g modifying keybinds, adding monitors etc)

clear

hyprland-look() {
    while true; do
        echo "-- HYPRLAND LOOKS --"
        echo "Change Looks/Decoration for Hyprland"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "1. Change Decoration (Blur, Rounding etc)             "
        echo "2. Change Animations (Window Transitions)             "
        echo "-------------------------------------------------------"
        echo "3. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice

        case $choice in 
            1)
                nano $HOME/.config/hypr/config/looks/decor.conf
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/looks/animations.conf
                clear
                ;;
            3)
                clear
                return
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}

hyprland-hardware() {
    while true; do
        echo "-- HYPRLAND HARDWARE --"
        echo "Change Hardware Settings"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "1. Manage Monitors (Add/Remove Monitors)              󰍹"
        echo "2. Manage Input Devices (Gestures, Peripheral, etc)   󰍽"
        echo "3. Set Primary Monitor                                󱋆"
        echo "-------------------------------------------------------"
        echo "4. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice

        case $choice in 
            1)
                nano $HOME/.config/hypr/config/hardware/monitor.conf
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/hardware/input.conf
                clear
                ;;
            3)
                nano $HOME/.config/hypr/config/hardware/primary.conf
                clear
                ;;
            4)
                clear
                return
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}

hyprland() {
    while true; do
        echo "-- HYPRLAND SETTINGS --" 
        echo "Change settings for Hyprland"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "1. Manage Looks/Decoration                           "
        echo "2. Manage Hardware (Monitors, Input devices etc)     󰍹"
        echo "-------------------------------------------------------"
        echo "3. Modify General Hyprland Settings                   "
        echo "4. Modify Keybinds                                    󰌌"
        echo "5. Modify Window/Layer Rules                          "
        echo "-------------------------------------------------------"
        echo "6. Modify Autostart Apps                              "
        echo "7. Modify Environment Variables                       "
        echo "-------------------------------------------------------"
        echo "8. Edit Hyprlock (Lock Screen)                        "
        echo "-------------------------------------------------------"
        echo "?. Help                                               󰋼"
        echo "9. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice

        case $choice in 
            1)
                clear
                hyprland-look
                clear
                ;;
            2)
                clear
                hyprland-hardware
                clear
                ;;
            3)
                nano $HOME/.config/hypr/config/software/general.conf
                clear
                ;;
            4)
                nano $HOME/.config/hypr/config/software/keybinds.conf
                clear
                ;;
            5)
                nano $HOME/.config/hypr/config/software/rules.conf
                clear
                ;;
            6)
                nano $HOME/.config/hypr/config/setup/misc.conf
                ;;
            7)
                nano $HOME/.config/hypr/config/setup/envvars.conf
                ;;
            8)
                nano $HOME/.config/hypr/hyprlock.conf
                ;;
            9)  
                clear
                return
                ;;
            [?])
                clear
                less $HOME/Dots/Guide/hyprland-help
                clear
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}

customization() {
    while true; do
        echo "-- CUSTOMIZE DOTFILES --"
        echo "Configure software included with GeoDots"
        echo ""
        echo "What would you like to do?"
        echo ""
        echo "-------------------------------------------------------"
        echo "1. Manage Command Aliases                             "
        echo "2. Change Cursor Theme                                󰇀"
        echo "-------------------------------------------------------"
        echo "3. Change Waybar Items (Status Bar)      (Unfinished) 󱔓"
        echo "4. Change Rofi Settings (Menus)          (Unfinished) "  
        echo "5. Change Swaync Settings (Notifs)       (Unfinished) "
        echo "-------------------------------------------------------"
        echo "6. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo ""
        read -p " ■ " choice

        case $choice in 
            1)
                nano $HOME/.config/sh/aliases.sh
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/cursortheme.conf
                clear
                ;;
            3)
                nano $HOME/.config/waybar/settings/items.jsonc
                clear
                ;;
            4)
                clear
                $HOME/Dots/Scripts/Settings/placeholder.sh
                clear
                ;;
            5)
                clear
                $HOME/Dots/Scripts/Settings/placeholder.sh
                clear
                ;;
            6)
                clear
                return
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
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
    echo "3. Manage Hyprland Settings                          "
    echo "4. Customize Dotfiles                                "
    echo "-------------------------------------------------------"
    echo "5. Upgrade Dotfiles               (Unfinished)        "
    echo "6. Remove Dotfiles                                    󱔌"
    echo "7. Update System                                      "
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
            hyprland
            clear
            ;;
        4) 
            clear
            customization
            clear
            ;;
        5)
        	clear
            echo "Getting update information, please wait.."
            $HOME/Dots/Scripts/Settings/dotsupgrade.sh    
            clear
            ;;
        6)
      	  	clear
            echo "Getting package list, please wait.."
            $HOME/Dots/Scripts/Settings/dotsremove.sh    
            clear
            ;;
        7)
            clear
            $HOME/Dots/Scripts/Settings/update.sh
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