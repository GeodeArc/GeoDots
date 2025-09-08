#!/bin/bash

AURH=$(cat $HOME/Dots/Options/aurhelper)

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