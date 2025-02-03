#!/bin/bash

STATE_FILE="/tmp/geodots_skipchecks"

clear

if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
    echo "Check skipping enabled!"
    else
        if pacman -Qq $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") &>/dev/null; then
            echo "Noto fonts already installed. Skipping this step."
            sleep 1
            exit 0
        fi
fi

install_noto_font() {
    while true; do
        echo "Installing noto fonts..."
        sudo pacman -Sy --needed $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") # In case of chaotic AUR users

        if pacman -Qq $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") &>/dev/null; then
            clear
            echo "Fonts are installed!"
            read -p "Press Enter when you are ready to move on."
            exit 0
        else
            echo ""
            echo "WARNING: Installation of nerd font failed or could not be verified."
            echo "Press ENTER to return to the main menu for another attempt"
            echo "Alternatively, type 'skip' to skip, or 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "skip" ]]; then
                exit 0
            fi
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
            fi
            clear
            return
            return
        fi
    done
}

while true; do
    echo "Couldnt find any/all noto-fonts, would you like to install them?"
    echo "This will ensure that you have most languages/symbols/emojis installed."
    echo ""
    echo "This will be a pretty large download, but id recommend it if you have the space."
    echo ""
    echo "Enter your choice [Y/N]"
    read -p " ■ " notofont

    case "$notofont" in
        [Yy]) install_noto_font ;;
        [Nn]) echo "Skipping!"; exit 0 ;;
        *)
            clear
            echo "X Invalid choice. Please try again."
            echo ""
            ;;
    esac
done