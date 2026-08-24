#!/bin/bash

curver="$(cat $HOME/Dots/Options/currentver)"
newver="$(curl -s https://geodearc.com/GeoDots/data/version)"

if [[ $curver != $newver ]]; then
    echo "New version available!"
    echo ""
    echo "Press ENTER to continue "
    read -p " ■ "
    clear
    echo "Downloading latest package lists"
    curl -o /tmp/pkg-pacman -s https://geodearc.com/GeoDots/data/pkg-pacman
    curl -o /tmp/pkg-aurs -s https://geodearc.com/GeoDots/data/pkg-aurs
    curl -o /tmp/pkg-gtk -s https://geodearc.com/GeoDots/data/pkg-gtk
    curl -o /tmp/pkg-qt -s https://geodearc.com/GeoDots/data/pkg-qt

    echo "Downloading upgrade script from github"
    curl -o /tmp/dots-upgrade.sh -s https://geodearc.com/dots-upgrade.sh
    dots-upgrade.sh
else
    echo "No new version seems to available."
    echo "If you believe this is incorrect, please check your internet connection."
    echo ""
    echo "Press ENTER to exit"
    read -p " ■ "
fi