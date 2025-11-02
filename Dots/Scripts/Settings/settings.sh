#!/bin/bash

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )
MAINMONITOR="$(cat $HOME/Dots/Options/mainmonitor)"
EDITOR="$(cat $HOME/Dots/Options/editor)"

clear

monitorselect() {
    while true; do
        # add command here that identifies monitors later? 
        echo "Enter the number of your preferred primary (main) monitor."
        # echo "These have been identified for you" - cant find any non-gui utility for this (yet, nwg-displays works but not well)
        for i in "${!MONITORS[@]}"; do
            echo "$((i+1)) - ${MONITORS[i]}"
        done

        echo ""
        echo -n " ■ "
        read -r choice

        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#MONITORS[@]} ]; then
            break
        fi
        clear
        echo "X Please try again."
        echo ""
    done

    selected_monitor=${MONITORS[$((choice-1))]}
    echo "$selected_monitor" > "$HOME/Dots/Options/mainmonitor"
    echo "\$monitor = $selected_monitor" > "$HOME/.config/hypr/config/hardware/primary.conf"
    clear
}

hyprland() {
    while true; do
        echo "-- HYPRLAND SETTINGS --" 
        echo "Change settings for Hyprland"
        echo 
        echo "What would you like to do?"
        echo 
        echo "-------------------------------------------------------"
        echo "1. Manage Monitors (Add/Remove Monitors)             󰍹" 
        echo "2. Set Primary Monitor                                󱋆"
        echo "-------------------------------------------------------"
        echo "3. Modify General Hyprland Settings                   "
        echo "4. Modify Keybinds                                    󰌌"
        echo "5. Modify Window/Layer Rules                          "
        echo "-------------------------------------------------------"
        echo "6. Modify Autostart Apps                              "
        echo "7. Modify Environment Variables                       "
        echo "-------------------------------------------------------"
        echo "Q. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo 
        read -p " ■ " choice

        case $choice in 
            1)
                $HOME/Dots/Scripts/Settings/Advanced/monitor.sh
                clear
                ;;
            2)
                clear
                monitorselect
                clear
                ;;
            3)
                $EDITOR $HOME/.config/hypr/config/software/general.conf
                clear
                ;;
            4)
                $EDITOR $HOME/.config/hypr/config/software/keybinds.conf
                clear
                ;;
            5)
                $EDITOR $HOME/.config/hypr/config/software/rules.conf
                clear
                ;;
            6)
                $EDITOR $HOME/.config/hypr/config/setup/autostart.conf
                clear
                ;;
            7)
                $EDITOR $HOME/.config/hypr/config/setup/envvars.conf
                clear
                ;;
            [qQ])
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
        echo 
        echo "What would you like to do?"
        echo 
        echo "-------------------------------------------------------"
        echo "1. Manage Command Aliases                             "
        echo "2. Change Cursor Theme                                󰇀"
        echo "-------------------------------------------------------"
        echo "3. Change Default Browser                             "
        echo "4. Change Default Media Player                        "
        echo "5. Change Default Terminal                            "
        echo "6. Change Default TUI Editor                          "
        echo "-------------------------------------------------------"
        echo "7. Waybar Monitor Selection                           󱔓"
        echo "8. Rofi Launcher Type                                 "
        echo "9. Enable/Disable Desktop Clock                       󰌑"  
        echo "-------------------------------------------------------"
        echo "Q. Return                                             󰌑"
        echo "-------------------------------------------------------"
        echo 
        read -p " ■ " choice

        case $choice in 
            1)
                $EDITOR $HOME/.config/sh/aliases.sh # its obvious enough, shouldnt need advanced config.
                clear
                ;;
            2)
                clear
                echo "Enter the exact name of your preferred cursor theme."
                echo "This will not appear until you restart Hyprland."
                echo "It will be overwritten if you select another theme (e.g light/dark)."
                echo 
                read -p "■ " choice
                echo "\$cursor_theme = $choice" > $HOME/.config/hypr/config/cursortheme.conf
                gsettings set org.gnome.desktop.interface cursor-theme "$choice"
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            3)
                clear
                echo "Enter the name of the default browser you want to use."
                echo "This should be the command you use to launch the browser."
                echo "If you arent sure, its probably the same as the package name (e.g firefox, chromium, etc)."
                echo
                read -p "■ " choice
                echo "$choice" > $HOME/Dots/Options/browser
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            4)
                clear
                read -p "First, OPEN the media player you want to use and press ENTER."
                clear
                echo "Enter the name of the default media player you want to use."
                echo "This needs to be the exact identifier used by playerctl."
                echo "Below are your currently open media players."
                echo
                playerctl --list-all
                echo
                read -p "■ " choice
                echo "$choice" > $HOME/Dots/Options/mediaplayer
                clear
                echo "(Optional) Enter an icon for the media player. This should be short, and preferably from nerdfonts.com."
                echo "Leave this blank and we will use the default icon:  "
                echo 
                read -p "■ " choice
                if [[ -z "$choice" ]]; then
                    echo "" > $HOME/Dots/Options/mediaicon
                else
                    echo "$choice" > $HOME/Dots/Options/mediaicon
                fi
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            5)
                clear
                echo "Enter the name of the default terminal you want to use."
                echo "This should be the command you use to launch the terminal."
                echo "If you arent sure, its probably the same as the package name (e.g kitty, alacritty, etc)."
                echo
                echo "It is also important to note that YOU will be responsible for configuring the new terminal emulator."
                echo 
                read -p "■ " choice
                echo "$choice" > $HOME/Dots/Options/terminal
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            6) 
                clear
                echo "Enter the name of the default TUI editor you want to use."
                echo "This should be the command you use to launch the editor."
                echo "If you arent sure, its probably the package name, but not always (e.g nano, nvim, micro etc)."
                echo
                read -p "■ " choice
                echo "$choice" > $HOME/Dots/Options/editor
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            7)
                clear
                echo "What would you like to do?"
                echo
                echo "1: Make Waybar ONLY appear on the main monitor"
                echo "2: Make Waybar appear on all monitors"
                echo 
                read -p "■ " choice

                case $choice in
                    1)
                        echo -e "{\n    \"output\": \"$MAINMONITOR\"\n}" > "$HOME/.config/waybar/settings/items.jsonc"
                        ;;
                    2)
                        echo "" > "$HOME/.config/waybar/settings/items.jsonc"
                        ;;
                esac
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            8)
                clear
                echo "What rofi launcher style would you like to use?"
                echo
                echo "1: Vertical Launcher"
                echo "2: Horizontal Launcher"
                echo 
                read -p "■ " choice

                case $choice in
                    1)
                        echo "vertical" > $HOME/Dots/Options/launchertype
                        ;;
                    2)
                        echo "horizontal" > $HOME/Dots/Options/launchertype
                        ;;
                esac
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            9) 
                clear
                echo "What would you like to do?"
                echo
                echo "1: Enable Desktop Clock"
                echo "2: Disable Desktop Clock"
                echo 
                read -p "■ " choice

                case $choice in
                    1)
                        echo "enabled" > $HOME/Dots/Options/clock
                        eww open clock &> /dev/null &
                        ;;
                    2)
                        echo "disabled" > $HOME/Dots/Options/clock
                        pkill eww
                        ;;
                esac
                clear
                read -p "Finished, press ENTER to continue."
                clear
                ;;
            [qQ])
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
    echo "5. Upgrade Dotfiles                                   "
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
            curl -o /tmp/pkg-pacman -s https://gdrc.me/GeoDots/data/pkg-pacman
            curl -o /tmp/pkg-aurs -s https://gdrc.me/GeoDots/data/pkg-aurs
            curl -o /tmp/pkg-gtk -s https://gdrc.me/GeoDots/data/pkg-gtk
            curl -o /tmp/pkg-qt -s https://gdrc.me/GeoDots/data/pkg-qt
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