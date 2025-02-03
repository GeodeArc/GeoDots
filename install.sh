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
echo "GeoDots Installer v0.0.1alpha"
echo "This installer currently donest help you if you have NVIDIA. Please check the hyprland wiki for NVIDIA instructions."
echo ""

while true; do
    echo "Welcome to Geode's Dots Installer!"
    echo "These dotfiles are specific to Arch Linux ONLY! An update may come eventually for other distrobutions"
    echo ""
    echo "┌─ Please choose an installation option:"
    echo "│"
    echo "├─ ▶  [1] Quick Install (NOT DONE YET)"
    echo "├─ ▶  [2] Guided Install"
    echo "├─ ?  [3] Whats the difference?"
    echo "├─ X  [4] Exit installation"  
    echo "│"
    echo "└─ Please type a number [1-4], and hit ENTER:"
    read -p " ■ " installtype

    case "$installtype" in
        1)
            ./Dots/Scripts/Installation/main-flashinstall.sh
            break
            ;;
        2)
            ./Dots/Scripts/Installation/main-guidedinstall.sh
            break
            ;;  
        3)
            clear
            echo "Quick install will let you choose between a few things, then will install the dotfiles in entirety. Select this if you dont care too much about specifics, and just want a working system. This will require quite a bit of free storage, and you must still enter your sudo password occasioanlly."
            echo ""
            echo "Guided install will let you pick and choose whats installed onto your system. Select this option if you would like to have a cleaner/more personalized system, or dont have a lot of storage. Like the quick installation, you will need to enter your sudo password at times."
            echo ""
            read -p "Press ENTER to continue: "
            clear
            ;;    
        4)  
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
