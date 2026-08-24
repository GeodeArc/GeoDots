#!/bin/bash

pkill waybar

echo "Running post install fixes"
$HOME/Dots/Scripts/fixup.sh

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )
BACKUPDIRS=( $(eza -1 --icons=never $HOME/GeoDots-BACKUP | grep -v ' ') )

clear
echo "Welcome back to GeoDots! You made it."
echo "Lets get everything set up again."
echo 

monitorselect() {
    while true; do
        # add command here that identifies monitors later? 
        echo "Enter the number of your preferred primary (main) monitor."
        # echo "These have been identified for you"
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
    echo "\$monitor = $selected_monitor" > "$HOME/.config/hypr/definitions/primary.conf" # this will change to lua eventually probably
    clear
}

restorebackup() {
    while true; do
        # if BACKUPDIRS has anything in it, then we have a backup
        if [[ -n "${BACKUPDIRS[@]}" ]]; then
            echo "Backup folder/s found. Please select a folder to restore."
            echo ""
            for i in "${!BACKUPDIRS[@]}"; do
                echo "$((i+1)) - ${BACKUPDIRS[i]}"
            done
            echo ""
            echo -n " ■ "
            read -r choice
            if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#BACKUPDIRS[@]} ]; then
                clear
                break
            fi
            clear
            echo "X Please try again."
            echo ""
        else
            echo "No backups found. Skipping."
            sleep 1
            clear
            return
        fi
    done

    selected_backup=${BACKUPDIRS[$((choice-1))]}

    while true; do
        echo "Restore wallpapers from $selected_backup? [Y/N]"
        echo ""
        read -p " ■ " choice
        
        case $choice in 
            [Yy])
                echo "Restoring wallpaper from $selected_backup"
                cp -r $HOME/GeoDots-BACKUP/$selected_backup/Dots/Wallpapers/. $HOME/Dots/Wallpapers/
                clear
                break
                ;;
            [Nn])
                clear
                break
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
    
    clear
    echo "Thats all we can restore for now."
    echo "Since GeoDots recently transitioned to the new lua syntax, we are unable to restore any other configurations."
    echo "If you backed up your configuration and want to move stuff over, please follow the hyprland wiki."
    echo "https://wiki.hyprland.org/Configuring/Start"
    echo 
    read -p "Press ENTER to continue."
}

monitorselect
restorebackup

notify-send -i system-run-symbolic "Applying Initial Settings" "Applying wallpaper, and setting a few things up."

setsid waypaper --wallpaper "$HOME/Dots/Wallpapers/wall1.jpg" &> /dev/null &
setsid waybar &> /dev/null &
eww open clock &> /dev/null &
mv $HOME/.config/hypr/config/keybinds-complete $HOME/.config/hypr/config/keybinds.lua
hyprctl reload # just incase idk if hyprland is gonna freak out yet.

echo "complete" > $HOME/Dots/Options/startup

clear
bash $HOME/Dots/Scripts/Settings/settings.sh
exit 0