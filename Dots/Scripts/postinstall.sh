#!/bin/bash

echo " 888888ba                      dP      .d88888b             dP                     "
echo " 88     8b                     88      88.    "'            88                     "
echo "a88aaaa8P  .d8888b. .d8888b. d8888P     Y88888b. .d8888b. d8888P dP    dP 88d888b. "
echo " 88        88    88 Y8ooooo.   88            `8b 88ooood8   88   88    88 88    88 "
echo " 88        88.  .88       88   88      d8    .8P 88.  ...   88   88.  .88 88.  .88 "
echo " dP         88888P'  88888P'   dP       Y88888P   88888P'   dP    88888P' 88Y888P  "
echo "                                                                          88       "
echo "                                                                          dP       "

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
