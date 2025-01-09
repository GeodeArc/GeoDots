#!/bin/bash

clear

STATE_FILE="/tmp/dotfontinstall"

if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "nerdfontinstalled" ]]; then
    echo "Nerd font already installed. Skipping this step."
    sleep 1
    exit 0
fi

install_nerd_font() {
    local font_name="$1"
    local font_pkg="$2"

    echo "Installing $font_name..."
    sudo pacman -Sy --needed "$font_pkg"

    echo "$font_name installed successfully!"
}

while true; do
    echo "Nerd Font may not be installed. Proceeding with installation!"
    echo ""
    echo "Select a Nerd Font to install. This will allow nerd emojis/icons to render correctly:"
    echo "▶  [1] JetBrainsMono Nerd Font"
    echo "▶  [2] Hack Nerd Font"
    echo "▶  [3] FiraCode Nerd Font"
    echo "◆  [4] Choose my own"
    echo "◆  [5] I already have a nerd font / skip"
    echo ""
    echo "Enter your choice of Font [1-5]: "
    read -p " ■ " nerdfont

    case "$nerdfont" in
        1)
            clear
            install_nerd_font "JetBrainsMono" "ttf-jetbrains-mono-nerd"
            break
            ;;
        2)
            clear
            install_nerd_font "Hack" "ttf-hack-nerd"
            break
            ;;
        3)
            clear
            install_nerd_font "FiraCode" "ttf-firacode-nerd"
            break
            ;;
        4)
            clear
            echo "Please visit https://www.nerdfonts.com/font-downloads to download a font of your choice, or use pacman."
            echo "If you are still in a TTY (no desktop), open up another TTY with CTRL+ALT+(F3-F12), and install a font with pacman."
            echo "Alternatively, close the script and reopen once installed. When prompted, select 'I already have a nerd font'."
            echo ""
            echo "Please note: You will not receive font updates by downloading a font from the website."
            echo ""
            read -p "Press Enter when you have manually installed your font." 
            exit 0
            break
            ;;
        5)
            clear
            echo "nerdfontinstalled" > "$STATE_FILE"
            sleep 1
            exit 0
            ;;
        *)
            clear
            echo "✗ Invalid choice. Please try again."
            echo ""
            ;;
    esac
done

fc-cache -fv
echo "nerdfontinstalled" > "$STATE_FILE"
clear
echo "Nerd Font installation complete!"
read -p "Press Enter when you are ready to move on." 
exit 0