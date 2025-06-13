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

echo "Removing installation folder"
rm $HOME/GeoDots/

echo "Setting wallpaper/applying some changes, please sit tight"
echo "Your waybar may flicker"

nohup waypaper --wallpaper $HOME/Dots/Wallpapers/wall1.jpg &
sleep 1
nohup waypaper --wallpaper $HOME/Dots/Wallpapers/wall1.jpg & # I have to do this twice because wal (or swww) sucks first time... smh
echo "complete" > $HOME/Dots/Options/startup

clear
echo "Finished setting up!"
echo "If waybar didnt recover, press SUPER+SHIFT+B"
echo

bash $HOME/Dots/Scripts/Hyprland/settings.sh

exit 0