#!/bin/bash

clear
echo " .d8888b.                    8888888b.           888             "
echo "d88P  Y88b                   888   Y88b          888             "
echo "888    888                   888    888          888             "
echo "888         .d88b.   .d88b.  888    888  .d88b  888888 .d8888b  "
echo "888  88888 d8P  Y8b d88  88b 888    888 d88  88b 888    88K      "
echo "888    888 88888888 888  888 888    888 888  888 888     Y8888b. "
echo "Y88b  d88P Y8b.     Y88..88P 888  .d88P Y88..88P Y88b.       X88 "
echo " Y8888P88   Y88888   Y88P8Y  88888888P   Y888YP   Y8888  88888P  "
echo ""
echo "This installer currently donest help you if you have NVIDIA. Please check the hyprland wiki for NVIDIA instructions."
echo ""

while true; do
    echo "Welcome to the GeoDots Installer!"
    echo "These dotfiles are specific to Arch Linux ONLY! An update may come eventually for other distros"
    echo ""
    echo "┌─ Please choose an installation option:"
    echo "│"
    echo "├─ ▶  [1] Install"
    echo "├─ ?  [2] About GeoDots"
    echo "├─ X  [3] Exit installation"  
    echo "│"
    echo "└─ Please type a number [1-4], and hit ENTER:"
    read -p " ■ " installtype

    case "$installtype" in
        1)
            ./Dots/Scripts/Installation/main-guidedinstall.sh 
            break
            ;;
        2)
            clear
            echo "GeoDots is a collection of configurations that can be applied with this simple installation script."
            echo "These dots are designed to be minimal, while remaining customizable, functional and (relatively) consistent."
            echo
            echo "Specs wise, any modern device with hardware acceleration should work well, and a display over 1366x768 is highly recommended."
            echo  
            echo "Please check the wiki for more information: https://github.com/GeodeArc/GeoDots/wiki"
            echo 
            read -p "Press ENTER to continue: "
            clear
            ;;    
        3)  
            clear
            echo "Bye bye!"
            exit 0
            ;;
        *)
            clear
            echo "X Invalid choice. Please try again."
            echo ""
            ;;
    esac
done
