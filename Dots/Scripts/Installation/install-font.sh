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
            echo "Fonts installed successfully!"
            read -p "Press Enter when you are ready to move on."
            exit 0
        else
            echo ""
            echo "WARNING: Installation of noto-fonts failed or could not be verified."
            read -p "Press ENTER to try again or type 'skip' to skip this step: " choice
            if [[ "$choice" == "skip" ]]; then
                break
            fi
            clear
        fi
    done
}

while true; do
    echo "Couldnt find any/all noto-fonts, would you like to install them?"
    echo "This will ensure that you have most languages/symbols/emojis installed."
    echo ""
    echo "This will be a pretty large download, but id recommend it if you have the space."
    echo ""
    echo "Enter your choice [Y OR N]"
    read -p " ■ " notofont

    case "$notofont" in
        y)
            install_noto_font
            break
            ;;
        Y)
            install_noto_font
            break
            ;;
        n)
            echo "Skipping!"
            break
            ;;
        N)
            echo "Skipping!"
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            sleep 1
            ;;
    esac
done