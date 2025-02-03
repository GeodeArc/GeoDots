#!/bin/bash

echo "▗▄▄▖  ▗▄▖  ▗▄▄▖▗▄▄▄▖     ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖ ▗▖▗▄▄▖ "
echo "▐▌ ▐▌▐▌ ▐▌▐▌     █      ▐▌   ▐▌     █  ▐▌ ▐▌▐▌ ▐▌"
echo "▐▛▀▘ ▐▌ ▐▌ ▝▀▚▖  █       ▝▀▚▖▐▛▀▀▘  █  ▐▌ ▐▌▐▛▀▘ "
echo "▐▌   ▝▚▄▞▘▗▄▄▞▘  █      ▗▄▄▞▘▐▙▄▄▖  █  ▝▚▄▞▘▐▌   "

echo ""
echo "Monitors found:"
echo "$(hyprctl monitors | grep Monitor)"
echo ""
echo "Descriptions (In same order):"
echo "$(hyprctl monitors | grep description)"
echo ""
echo "Please choose your primary monitor from the list above."
echo "e.g for 'Monitor: DP-1 (ID 0):', You would type: DP-1"
read -p "Monitor: " monitor

echo $monitor > $HOME/Dots/Scripts/Hyprland/mainmonitor

waypaper --random

echo "Will add more to this script later, for now, edit the hyprland config to your liking, and hopefully you have a working PC!"
read -p "Press ENTER to exit." 

#echo "You have more than one monitor"
#echo "Would you like to setup your monitors now, or just leave it at the defaults? [Y/N]"
#read -p " ■ " 
# List monitors (somehow) and do each monitor at a time.
# Save user specified info like rotation, scale, and position
# Automatically choose best resolution
# Refresh rate is too risky, let the user configure this later.#!/bin/bash
# Save to ~/Dots/Options maybe?

# Other ~/Dots/Options stuff
