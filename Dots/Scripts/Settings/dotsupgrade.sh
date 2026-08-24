#!/bin/bash

curver="$(cat $HOME/Dots/Options/currentver)"
newver="$(curl -s https://geodearc.com/GeoDots/data/ver)"

if [[ $curver != $newver ]]; then
    echo "New version available!"
    echo ""
    echo "Press ENTER to continue "
    read -p " ■ "
    clear
    echo "Downloading upgrade script from github"
    curl -o /tmp/dots-upgrade.sh -s https://geodearc.com/dots-upgrade.sh
    chmod +x /tmp/dots-upgrade.sh
    clear
    /tmp/dots-upgrade.sh
else
    echo "No new version seems to available."
    echo "If you believe this is incorrect, please check your internet connection."
    echo ""
    echo "Press ENTER to exit"
    read -p " ■ "
fi