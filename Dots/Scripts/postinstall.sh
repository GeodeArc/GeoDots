#!/bin/bash

echo " 888888ba                      dP      .d88888b             dP                     "
echo " 88     8b                     88      88.                  88                     "
echo "a88aaaa8P  .d8888b. .d8888b. d8888P     Y88888b. .d8888b. d8888P dP    dP 88d888b. "
echo " 88        88    88 Y8ooooo.   88             8b 88ooood8   88   88    88 88    88 "
echo " 88        88.  .88       88   88      d8    .8P 88.  ...   88   88.  .88 88.  .88 "
echo " dP         88888P   88888P    dP       Y88888P   88888P    dP    88888P  88Y888P  "
echo "                                                                          88       "
echo "                                                                          dP       "

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )

monitorselect() {
    while true; do
        echo "Select a monitor:"
        for i in "${!MONITORS[@]}"; do
            echo "$((i+1))) ${MONITORS[i]}"
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
    clear
}

monitorselect

waypaper --wallpaper $HOME/Dots/Wallpapers/wall1.jpg

echo "Moving GeoDots config to backup"
mv $HOME/GeoDots/ $HOME/Dots/Backup/Install/

echo "complete" > $HOME/Dots/Options/startup

sleep 1

#echo "You have more than one monitor"
#echo "Would you like to setup your monitors now, or just leave it at the defaults? [Y/N]"
#read -p " ■ " 
# List monitors (somehow) and do each monitor at a time.
# Save user specified info like rotation, scale, and position
# Automatically choose best resolution
# Refresh rate is too risky, let the user configure this later.#!/bin/bash
# Save to ~/Dots/Options maybe?

# Other ~/Dots/Options stuff
