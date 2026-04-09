#!/bin/bash

pkill waybar

echo "Welcome to GeoDots! You made it."
echo "Before we continue, we must set up a few things."
echo 

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )

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
    echo "\$monitor = $selected_monitor" > "$HOME/.config/hypr/config/hardware/primary.conf"
    clear
}

monitorselect

notify-send -i system-run-symbolic "Applying Initial Settings" "Applying wallpaper, and setting a few things up."

setsid waypaper --wallpaper "$HOME/Dots/Wallpapers/wall1.jpg" &> /dev/null &
eww open clock &> /dev/null &
mv $HOME/.config/hypr/config/software/keybinds-complete.conf $HOME/.config/hypr/config/software/keybinds.conf

echo "complete" > $HOME/Dots/Options/startup

clear
bash $HOME/Dots/Scripts/Settings/settings.sh
exit 0