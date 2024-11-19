#!/bin/bash

# Path to the state file
STATE_FILE="/tmp/dotfontinstall"

# Check if the state file exists and has "nerdfontinstalled"
if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "nerdfontinstalled" ]]; then
    echo "Nerd font already installed. Skipping this step."
    exit 0
fi

# Create fonts directory
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Function to download and install a nerd font
install_nerd_font() {
    local font_name="$1"
    local font_url="$2"

    echo "Downloading $font_name..."
    wget -q --show-progress -O "/tmp/${font_name}.zip" "$font_url"

    echo "Installing $font_name..."
    unzip -q "/tmp/${font_name}.zip" -d "$FONT_DIR"
    rm "/tmp/${font_name}.zip"

    echo "$font_name installed successfully!"
}

# Choice
while true; do
    clear
    echo "Nerd Font not installed. Proceeding with installation!"
    echo ""
    echo "Select a Nerd Font to install. This will allow nerd emojis/icons to render correctly:"
    echo "1) JetBrainsMono Nerd Font"
    echo "2) Hack Nerd Font"
    echo "3) FiraCode Nerd Font"
    echo "4) Choose my own"
    echo "5) I already have a nerd font! What are you talking about?"
    echo ""

    read -p "Enter your choice of Font [1-5]: " choice

    case "$choice" in
        1)
            clear
            install_nerd_font "JetBrainsMono" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
            break
            ;;
        2)
            clear
            install_nerd_font "Hack" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
            break
            ;;
        3)
            clear
            install_nerd_font "FiraCode" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
            break
            ;;
        4)
            clear
            echo "Please visit https://www.nerdfonts.com/font-downloads to download a font of your choice."
            read -p "Press Enter when you have manually installed your font." 
            break
            ;;
        5)
            clear
            echo "Whoops! Sorry about that! Continuing.."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            sleep 1
            ;;
    esac
done

# Update state file and refresh font cache
fc-cache -fv
echo "nerdfontinstalled" > "$STATE_FILE"
clear
echo "Nerd Font installation complete"
exit 0
