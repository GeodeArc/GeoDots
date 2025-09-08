#!/bin/bash

AURH=$(cat $HOME/Dots/Options/aurhelper)

if [ -z "$AURH" ]; then
    echo "AUR Helper not found"
    echo "This is likely because you skipped AUR installation, or set a custom AUR helper"
    echo "Please add your AUR helpers update command to $HOME/Dots/Options/aurhelper"
    echo 
    read -p "Press ENTER to exit"
    exit 1
fi

echo "Updating system packages + AUR packages (SUDO required)"
$AURH
echo 
read -p "Completed, note down any errors above, then press ENTER to move on."
clear
echo "Updating flatpaks"
flatpak update
echo 
read -p "Completed, note down any errors above, then press ENTER exit the updater."
clear