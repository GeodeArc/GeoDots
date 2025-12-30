#!/bin/bash

curver="$(cat $HOME/Dots/Options/currentver)"
newver="$(curl -s https://gdrc.me/GeoDots/data/version)"

codirs="$(curl -s https://gdrc.me/GeoDots/data/dirs)"
directory="$HOME/.config"
aurhelper="$(cat $HOME/Dots/Options/aurpkgs)"
aurupgrade="$(cat $HOME/Dots/Options/aurhelper)"
apptype="$(cat $HOME/Dots/Options/apptype)"
theme="$(cat $HOME/Dots/Options/theme)"
style="$(cat $HOME/Dots/Options/style)"

PACMAN_PKGS="$(cat /tmp/pkg-pacman)"
AUR_PKGS="$(cat /tmp/pkg-aurs)"
GTK_PKGS="$(cat /tmp/pkg-gtk)"
QT_PKGS="$(cat /tmp/pkg-qt)"

echo ""
echo "Current Dotfiles Version: $curver"
echo "New Dotfiles Version: $newver"
echo ""

backup () {
    while true; do
        echo "Would you like to backup existing config folders? [Y/N]"
        read -p " ■ " choice
        case "$choice" in
                [Yy])
                backupdir="$HOME/GeoDots-BACKUP/$(date +'%Y-%m-%d-%H:%M:%S')"

                mkdir -p "$backupdir"
                cp -a "$HOME/.zshrc" "$backupdir"
                cp -a "$HOME/.bashrc" "$backupdir" 
                cp -a "$HOME/Dots" "$backupdir" 

                for dir in $codirs; do
                    source="$HOME/.config/$dir"

                    if [ -d "$source" ]; then
                        echo "Creating backup $source to $directory"
                        cp -r "$source" "$backupdir/$dir"
                    else
                        echo "Skipping $dir, doesnt exist"
                    fi
                done

                clear
                break
                ;;
                [Nn])
                clear
                break
                ;;
                *)
                clear
                echo "X Please try again."
                echo ""
                ;;
            esac    
    done
}

dotsdownload() {
    while true; do
        echo "It is recommended to update your system before installation."
        echo "Do this now? [Y/N]"
        read -p " ■ " choice
        
        case "$choice" in
            [Yy])
                sudo pacman -Syu
                clear
                break
                ;;
            [Nn])
                clear
                break
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
            ;;
        esac
    done

    echo "Removing previous version if needed"
    sudo rm -r GeoDots
    clear
    echo "Cloning Repo"
    git clone https://github.com/GeodeArc/GeoDots
    clear
    read -p "Cloned repo. Press ENTER to continue"
    clear
}

pkgdownload() {
    while true; do
        echo ""
        echo "Installing any new pacman packages"
        sudo pacman -S --needed $PACMAN_PKGS
        if pacman -Qq $PACMAN_PKGS &>/dev/null; then
            clear
            echo "Packages installed successfully!"
            read -p "Press Enter when you are ready to move on."
            clear
            break
        else
            echo ""
            echo "WARNING: Installation of packages failed or could not be verified."
            echo "Press ENTER for another attempt"
            read -p " ■ "
            clear
        fi
    done

    while true; do
        echo "Installing any new AUR packages"
        $aurhelper $AUR_PKGS
        if pacman -Qq $AUR_PKGS &>/dev/null; then
            clear
            echo "AURs installed successfully!"
            read -p "Press Enter when you are ready to move on."
            clear
            break
        else
            echo ""
            echo "WARNING: Installation of AURs failed or could not be verified."
            echo "Press ENTER for another attempt"
            read -p " ■ "
            clear
        fi
    done

    while true; do
        echo "Installing $apptype packages" # check if qt or gtk, install either GTK_APPS or QT_APPS
        if [[ "$apptype" == "qt" ]]; then
            $aurhelper $QT_PKGS
            if pacman -Qq $QT_PKGS &>/dev/null; then
                echo -e "\$fileManager = dolphin \n\$textEditor = kwrite \n\$polkitAgent = hyprpolkitagent" | sudo tee $HOME/GeoDots/.config/hypr/config/apptype.conf
                clear
                echo "QT Packages installed successfully!"
                read -p "Press Enter when you are ready to move on."
                clear
                break
            else
                echo ""
                echo "WARNING: Installation of QT packages failed or could not be verified."
                echo "Press ENTER for another attempt"
                read -p " ■ "
                clear
            fi
        elif [[ "$apptype" == "gtk" ]]; then
            $aurhelper $GTK_PKGS
            if pacman -Qq $GTK_PKGS &>/dev/null; then
                echo -e "\$fileManager = nautilus --new-window \n\$textEditor = gnome-text-editor --new-window \n\$polkitAgent = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" | sudo tee $HOME/GeoDots/.config/hypr/config/apptype.conf
                clear
                echo "GTK Packages installed successfully!"
                read -p "Press Enter when you are ready to move on."
                clear
                break
            else
                echo ""
                echo "WARNING: Installation of GTK packages failed or could not be verified."
                echo "Press ENTER for another attempt"
                read -p " ■ "
                clear
            fi
        else
            echo "Warning: App type file not found/invalid. Installing fallback packages, modify hyprland configs to your specification."
            $aurhelper nautilus gnome-text-editor gnome-software gnome-keyring polkit-gnome kate kwrite dolphin discover kwallet hyprpolkitagent
            break
        fi
    done
}

dotsupgrade() {
    while true; do
        clear
        echo "Ready to upgrade GeoDots?"
        echo "This will REMOVE your existing dotfiles related config files, and replace them with the latest version."
        echo "This means any modifications you have made will be lost UNLESS you have backed them up."
        echo "You can access the backup folder once the upgrade is complete, and move any files wanted back in."
        echo ""
        echo "Config directories that will be updated:"
        echo "$codirs"
        echo ""
        echo "Continue? Your PC will restart after the upgrade is complete. [Y/N]"
        read -p " ■ " choice
        case "$choice" in
            [Yy])
                for dir in $codirs; do
                    source="$HOME/.config/$dir"

                    if [ -d "$source" ]; then
                        echo "Removing $source"
                        sudo rm -r "$source"
                    else
                        echo "Skipping $dir, doesnt exist"
                    fi
                done
                sleep 1

                echo "Copying Options from previous install"
                cp -r $HOME/Dots/Options/. $HOME/GeoDots/Dots/Options/

                echo "Copying other options from previous install"
                echo "alias updatepkgs='$aurupgrade'" >> $HOME/GeoDots/.config/sh/aliases.sh

                if [[ "$theme" == "dark" ]]; then
                    echo -e "\$cursortheme = Bibata-Modern-Classic" | sudo tee "$HOME/GeoDots/.config/hypr/config/cursortheme.conf" >/dev/null
                else
                    echo -e "\$cursortheme = Bibata-Modern-Ice" | sudo tee "$HOME/GeoDots/.config/hypr/config/cursortheme.conf" >/dev/null
                fi

                cp -a "$HOME/GeoDots/.config/waybar/$style/$theme/." "$HOME/GeoDots/.config/waybar/"
                cp -a "$HOME/GeoDots/.config/swaync/$style/$theme/." "$HOME/GeoDots/.config/swaync/"
                cp -a "$HOME/GeoDots/.config/rofi/$style/$theme/config.rasi" "$HOME/GeoDots/.config/rofi/"
                cp -a "$HOME/GeoDots/.config/swayosd/$style/$type.css" "$HOME/GeoDots/.config/swayosd/style.css"
                cp -r $HOME/GeoDots/.config/hypr/themes/$style/theme.conf $HOME/GeoDots/.config/hypr/
                cp -r $HOME/GeoDots/.config/hypr/themes/$style/$theme/hyprlock.conf $HOME/GeoDots/.config/hypr/

                echo "Removing ~/Dots"
                sudo rm -r "$HOME/Dots"
                
                sudo cp -a $HOME/GeoDots/.config/. $HOME/.config/
                cp -r $HOME/.config/sh/.zshrc $HOME
                cp -r $HOME/.config/sh/.bashrc $HOME

                cp -a $HOME/GeoDots/Dots $HOME/Dots

                for dir in $codirs; do
                    source="$HOME/.config/$dir"
                    directory="$HOME/Dots/Config"

                    if [ -d "$source" ]; then
                        echo "Linking $source to $directory"
                        ln -sf "$source" "$directory"
                    else
                        echo "Skipping $source, doesnt exist"
                    fi
                done

                echo "Generating default color scheme:"
                wal -i "$HOME/Dots/Wallpapers/wall1.jpg"
                ln -s $HOME/.cache/wal/colors-hyprland.conf $HOME/.config/hypr/config/colors.conf
                ln -s $HOME/.cache/wal/colors-rofi.rasi $HOME/.config/rofi/options/colors.rasi
                ln -s $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/colors.css
                
                echo $newver > $HOME/Dots/Options/currentver
                echo "postupgrade" > $HOME/Dots/Options/startup

                clear
                echo "Congratulations, DOTFILES should be successfully updated!"
                echo "A reboot is required for most things to work"
                echo ""
                echo "Rebooting in 5 seconds, press CTRL+C to abort!"
                sleep 5
                sudo reboot
                ;;
            [Nn])
                clear
                rm /tmp/pkg-pacman
                rm /tmp/pkg-aurs
                rm /tmp/pkg-gtk 
                rm /tmp/pkg-qt
                read -p "Aborted, press ENTER to exit"
                exit 0;
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}

if [[ $curver != $newver ]]; then
    echo "New version available!"
    echo ""
    echo "Press ENTER to continue "
    read -p " ■ "
    clear
    backup
    dotsdownload
    pkgdownload
    dotsupgrade
else
    echo "No new version seems to available."
    echo "If you believe this is incorrect, please check your internet connection."
    echo ""
    echo "Press ENTER to exit"
    read -p " ■ "
fi