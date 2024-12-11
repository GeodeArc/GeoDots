#!/bin/bash

install_noto_font() {
    echo "Installing noto fonts..."
    sudo pacman -Sy --needed $(pacman -Ssq noto-fonts)
    echo "$font_name installed successfully!"
    echo ""
}

while true; do
    clear
    echo "Would you like to install all noto-fonts?"
    echo "This will ensure that you have most languages/symbols/emojis present:"
    echo "This will be a pretty large download, but is recommended for most users"
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