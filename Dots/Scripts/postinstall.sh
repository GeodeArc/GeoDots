#!/bin/bash

echo " 888888ba                      dP      .d88888b             dP                     "
echo " 88     8b                     88      88.                  88                     "
echo "a88aaaa8P  .d8888b. .d8888b. d8888P     Y88888b. .d8888b. d8888P dP    dP 88d888b. "
echo " 88        88    88 Y8ooooo.   88             8b 88ooood8   88   88    88 88    88 "
echo " 88        88.  .88       88   88      d8    .8P 88.  ...   88   88.  .88 88.  .88 "
echo " dP         88888P   88888P    dP       Y88888P   88888P    dP    88888P  88Y888P  "
echo "                                                                          88       "
echo "                                                                          8P       "

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )

monitorselect() {
    while true; do
        echo "Select a monitor:"
        for i in "${!MONITORS[@]}"; do
            echo "$((i+1)) - ${MONITORS[i]}"
        done

        echo -n "Enter the number of your preferred primary (main) monitor: "
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

notify-send -i system-run-symbolic "Applying Initial Colors" "Waybar may flicker, and notifications may double due to a bug in pywal. This is normal."

mv "$HOME/GeoDots/" "$HOME/Dots/Scripts/Installation/GeoDots-$(date +'%Y-%m-%d-%H:%M:%S')"

setsid waypaper --wallpaper "$HOME/Dots/Wallpapers/wall1.jpg" &> /dev/null &
sleep 1
setsid waypaper --wallpaper "$HOME/Dots/Wallpapers/wall1.jpg" &> /dev/null & # I have to do this twice because wal (or swww) sucks first time... smh

echo "complete" > $HOME/Dots/Options/startup

clear
echo

bash $HOME/Dots/Scripts/Hyprland/settings.sh

exit 0