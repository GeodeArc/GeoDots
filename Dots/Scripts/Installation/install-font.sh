#!/bin/bash

clear

if pacman -Qq | grep -qE '^noto-fonts(-|$)'; then
    echo "Noto fonts already installed. Skipping this step."
    sleep 1
    exit 0
fi

install_noto_font() {
    echo "Installing noto fonts..."
    sudo pacman -Sy --needed $(pacman -Ssq noto-fonts)
    echo "$font_name installed successfully!"
    echo ""
}

while true; do
    clear
    echo "Couldnt find any/all noto-fonts, would you like to install them?"
    echo "This will ensure that you have most languages/symbols/emojis present:"
    echo "This will be a pretty large download, but id recommend it if you have the space."
    read -p "[Y OR N] " notofont

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