#!/bin/bash

# TO DO: 
# Allow different editors from nano (neovim, user specified during setup)
# Actually complete everything
# Make things more complex (e.g modifying keybinds, adding monitors etc)

# For advanced config, as well as advanced options, still allow users to edit the file directly if they please
# Dont add literally every option to advanced options, only the most important stuff (listed)

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )

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
                nano $HOME/.config/hypr/config/looks/decor.conf # Add advanced config - Gaps, Rounding, Blur, Shadow, Border colors
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/looks/animations.conf # just editor
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
                $HOME/Dots/Scripts/Settings/Advanced/monitor.sh
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/hardware/input.conf # Add advanced config, sensitivity, gestures, and kb layout.
                clear
                ;;
            3)
                clear
                echo "Below are your current monitors."
                echo "Please copy one to use for the new primary monitor (e.g DP-1, Virtual-1)"
                echo 
                for i in "${!MONITORS[@]}"; do
                    echo "${MONITORS[i]}"
                done
                echo 
                read -p "Press ENTER to continue"
                nano $HOME/.config/hypr/config/hardware/primary.conf # Maybe change to selection instead of nano, like postinstall.sh
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
                nano $HOME/.config/hypr/config/software/keybinds.conf # Advanced config, add or edit keybinds (this will be tricky but so worth).
                clear
                ;;
            5)
                nano $HOME/.config/hypr/config/software/rules.conf # Advanced config, add or edit window rules AND layer rules.
                clear
                ;;
            6)
                nano $HOME/.config/hypr/config/setup/autostart.conf # Advanced config, add or edit autostart apps.
                clear
                ;;
            7)
                nano $HOME/.config/hypr/config/setup/envvars.conf # Advanced config, add or edit environment variables.   
                clear
                ;;
            8)
                nano $HOME/.config/hypr/hyprlock.conf # Advanced config, wallpaper, widgets enabled, media player maybe, fingerprint, etc.
                clear
                ;;
            9)  
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
                nano $HOME/.config/sh/aliases.sh # Advanced config, add or edit aliases.
                clear
                ;;
            2)
                nano $HOME/.config/hypr/config/cursortheme.conf # Advanced config, set cursor theme (should be really easy)
                clear
                ;;
            3)
                nano $HOME/.config/waybar/settings/items.jsonc # Advanced config, modify/change order of items, change workspaces, etc.
                clear
                ;;
            4)
                clear
                $HOME/Dots/Scripts/Settings/placeholder.sh # Advanced config, change image, change rofi-emoji to smile, font?, vertical/horizontal launcher.
                clear
                ;;
            5)
                clear
                $HOME/Dots/Scripts/Settings/placeholder.sh # Advanced config, change control panel items, change media player type etc? 
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