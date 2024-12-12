AUR_FILE="/tmp/dotaurinstall"

if [[ -f "$AUR_FILE" ]]; then
    clear
    echo "AUR helper already installed. Skipping this step."
    sleep 1
    exit 0
fi

install_aur_helper() {
    local aurh_name="$1"
    local aurh_url="$2"
    
    clear
    echo "Downloading $aurh_name...}"
    git clone $aurh_url ~/$aurh_name
    clear
    echo "Now installing"
    cd ~/$aurh_name
    makepkg -si

    echo "$aurh_name installed successfully!"
    echo "$aurh_name" > "$AUR_FILE"
    sleep 1
}

installed_aur_helper() {
    while true; do
        clear
        echo "What AUR Helper do you have?"
        echo ""
        echo "1) yay"
        echo "2) paru"
        echo ""
        read -p "Please choose an option [1-2] " installedaur

        case "$installedaur" in
                1)
                    echo "yay -Sy" > "$AUR_FILE"
                    echo "Set yay as AUR helper"
                    break
                    ;;
                2)
                    echo "paru -Sy" > "$AUR_FILE"
                    echo "Set paru as AUR helper"
                    break
                    ;;
                *)

        esac
    done
}

custom_aur_helper() {
    clear
    echo "Please specify the command your AUR helper uses to install packages/preferably update the repository as well"
    echo "There can be no mistakes here. Dotfiles installation will not work properly/at all if this is messed up. Good luck I suppose."
    echo "If you got here accidentally, please restart the installation by pressing CTRL+C"
    echo ""
    echo "E.g: 'paru -Sy', or 'yay -Sy'"
    read -p "Enter here: " customaur

    echo "Setting $customaur as AUR helper"
    echo $customaur > "$AUR_FILE"
    sleep 1
}

while true; do
    clear
    echo "An AUR helper is needed for installation. Please pick either yay or paru "
    echo ""
    echo "yay is a simple/lightweight AUR helper known for its simplicity. Some of the defaults it has can be confusing."
    echo "paru is a feature rich/lightweight AUR helper known for good defaults/user experience. It does take longer to install, due to it using rust and its compiler."
    echo "You can always install another aur helper at any time, dont feel locked into one."
    echo ""
    echo "1) yay"
    echo "2) paru"
    echo "3) I already have yay/paru."
    echo "4) I already have another AUR helper"
    echo ""
    read -p "Please choose an option [1-4] " aurhelper

    case "$aurhelper" in
            1)
                clear
                install_aur_helper "yay" "https://aur.archlinux.org/yay"
                break
                ;;
            2)
                clear
                install_aur_helper "paru" "https://aur.archlinux.org/paru"
                break
                ;;
            3)
                installed_aur_helper
                break
                ;;
            4)
                custom_aur_helper 
                break
                ;;
            *)
                echo "Invalid choice. Please try again."
                sleep 1
                ;;
    esac
done