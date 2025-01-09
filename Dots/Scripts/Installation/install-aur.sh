#!/bin/bash

clear

AUR_FILE="/tmp/dotaurinstall"

if [[ -f "$AUR_FILE" ]]; then
    echo "AUR helper already installed. Skipping this step."
    sleep 1
    exit 0
fi

install_aur_helper() {
    local aurh_name="$1"
    local aurh_url="$2"
    
    clear
    echo "Downloading $aurh_name..."
    git clone $aurh_url ~/$aurh_name
    clear
    echo "Now installing"
    cd ~/$aurh_name
    makepkg -si

    if pacman -Q $aurh_name &>/dev/null; then
        echo "$aurh_name installed successfully!"
        echo "$aurh_name -Sy" > "$AUR_FILE"
        sleep 1
        exit 0
    else
        echo ""
        echo "WARNING: Installation of $aurh_name failed or could not be verified."
        read -p "Press ENTER to return to the main menu for another attempt."
        clear
        return
    fi
}

installed_aur_helper() {
    while true; do
        echo "What AUR Helper do you have?"
        echo ""
        echo "▶  [1] yay"
        echo "▶  [2] paru"
        echo "◆  [3] Go Back"
        echo ""
        echo "Please type an number [1-2], and hit ENTER:"
        read -p " ■ " installaur

        case "$installaur" in
               1)
                   if pacman -Q yay &>/dev/null; then
                        clear
                        echo "yay verified to be installed."
                        echo "yay -Sy" > "$AUR_FILE"
                        sleep 1
                        exit 0
                    else
                        read -p "Couldnt seem to find yay, press ENTER to go back"
                    fi
                    ;;
                2)
                    if pacman -Q paru &>/dev/null; then
                        clear
                        echo "paru verified to be installed."
                        echo "paru -Sy" > "$AUR_FILE"
                        sleep 1
                        exit 0
                    else
                        read -p "Couldnt seem to find paru, press ENTER to go back"
                    fi
                    ;;
                3)
                    clear
                    return
                    ;;
                *)
                    clear
                    echo "✗ Invalid choice. Please try again."
                    echo ""
                    ;;
        esac
    done
}

custom_aur_helper() {
    while true; do
        echo "Please specify the command your AUR helper uses to install packages/preferably update the repositories as well."
        echo "- Check your AUR helpers documentation if you dont know what command/flags you need to use."
        echo "- Be careful here, Installation will not work properly/at all if this is messed up."
        echo ""
        echo "If you got here by mistake, please type 'back' in lowercase to return to the previous menu."
        echo ""
        echo "E.g: 'paru -Sy', or 'yay -Sy'"
        read -p "Enter here: " customaur

        if [[ "$customaur" == "back" ]]; then
            clear
            return
        fi

        if [[ -n "$customaur" ]]; then
            echo "Setting $customaur as AUR helper"
            echo $customaur > "$AUR_FILE"
            read -p "Press ENTER to continue, or CTRL+C if you made a mistake"
            exit 0
        else
            clear
            echo "✗ Invalid choice. Please try again."
            echo ""
        fi
    done
}

while true; do
    echo "An AUR helper is needed for installation. Please pick either yay or paru, or specify one."
    echo ""
    echo "yay is a simple/lightweight AUR helper known for its simplicity. Some of the defaults it has can be confusing."
    echo "paru is a feature rich/lightweight AUR helper known for good defaults/user experience. It does take longer to install, due to it using rust and its compiler."
    echo "You can always install another aur helper at any time, dont feel locked into one."
    echo ""
    echo "▶  [1] yay"
    echo "▶  [2] paru"
    echo "◆  [3] I already have yay/paru."
    echo "◆  [4] I already have another AUR helper"
    echo ""
    read -p "Please choose an option [1-4] " aurhelper

    case "$aurhelper" in
            1)
                clear
                install_aur_helper "yay" "https://aur.archlinux.org/yay"
                ;;
            2)
                clear
                install_aur_helper "paru" "https://aur.archlinux.org/paru"
                ;;
            3)
                clear
                installed_aur_helper
                ;;
            4)
                clear
                custom_aur_helper 
                ;;
            *)
                clear
                echo "✗ Invalid choice. Please try again."
                echo ""
                ;;
    esac
done