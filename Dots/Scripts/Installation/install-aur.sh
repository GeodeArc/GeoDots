#!/bin/bash

STATE_FILE="/tmp/geodots_skipchecks"
AUR_FILE="/tmp/geodots_aurhelper"

clear

if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
    echo "Check skipping enabled!"
    else
        if pacman -Qq yay &>/dev/null; then
            echo "AUR helper (yay) already installed. Skipping this step."
            echo "yay -Sy --needed" > "$AUR_FILE"
            sleep 1
            exit 0
        fi
        if pacman -Qq paru &>/dev/null; then
            echo "AUR helper (paru) already installed. Skipping this step."
            echo "paru -Sy --needed" > "$AUR_FILE"
            sleep 1
            exit 0
        fi
fi

install_aur_helper() {
    local aurh_name="$1"
    local aurh_url="$2"
    
    clear
    echo "Checking if dependencies are met"
    sudo pacman -Sy --needed git base-devel
    if pacman -Q git base-devel &>/dev/null; then
        echo "Dependencies installed."
    else
        echo ""
        echo "WARNING: Installation of base dependencies failed or could not be verified."
        read -p "Press ENTER to return to the main menu for another attempt."
        clear
        return        
    fi

    echo "Downloading $aurh_name..."
    git clone $aurh_url ~/$aurh_name
    clear
    echo "Now installing"
    cd ~/$aurh_name
    makepkg -si

    if pacman -Q $aurh_name &>/dev/null; then
        clear
        echo "$aurh_name installed successfully!"
        echo "$aurh_name -Sy --needed" > "$aurh_name"
        rm $HOME/$AUR_FILE
        echo "AUR helper installed!"
        read -p "Press Enter when you are ready to move on."
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
                        echo "yay -Sy --needed" > "$AUR_FILE"
                        sleep 1
                        exit 0
                    else
                        echo ""
                        echo "Couldnt seem to find yay, are you sure its installed? Press ENTER to go back."
                        echo "If you are SURE it is installed, or like to watching things break, type 'iamasillybilly' to skip."
                        read -p " ■ " skipaur
                        if [[ "$skipaur" == "iamasillybilly" ]]; then
                            echo "yay -Sy --needed" > "$AUR_FILE"
                            exit 0
                        fi
                        clear
                        return                        
                    fi
                    ;;
                2)
                    if pacman -Q paru &>/dev/null; then
                        clear
                        echo "paru verified to be installed."
                        echo "paru -Sy --needed" > "$AUR_FILE"
                        sleep 1
                        exit 0
                    else
                        echo ""
                        echo "Couldnt seem to find paru, are you sure its installed? Press ENTER to go back."
                        echo "If you are SURE it is installed, or like to watching things break, type 'iamasillybilly' to skip."
                        read -p " ■ " skipaur
                        if [[ "$skipaur" == "iamasillybilly" ]]; then
                            echo "paru -Sy --needed" > "$AUR_FILE"
                            exit 0
                        fi
                        clear
                        return
                    fi
                    ;;
                3)
                    clear
                    return
                    ;;
                *)
                    clear
                    echo "X Invalid choice. Please try again."
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
        echo "E.g: 'paru -Sy --needed', or 'yay -Sy --needed'"
        read -p "Enter here: " customaur

        if [[ "$customaur" == "back" ]]; then
            clear
            return
        fi

        if [[ -n "$customaur" ]]; then
            echo "Setting $customaur as AUR helper"
            echo $customaur > "$AUR_FILE"
            echo ""
            echo "Press ENTER to continue, or 'back' if you made a mistake"
            read -p " ■ " finalaurcheck
            
            if [[ "$finalaurcheck" == "back" ]]; then
                clear
                return
            fi
            exit 0
        else
            clear
            echo "X Please try again."
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
                echo "X Invalid choice. Please try again."
                echo ""
                ;;
    esac
done