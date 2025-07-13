#!/bin/bash

#
# VARS
#

APPTYPE_FILE="$(cat /tmp/geodots_apptype)"
AUR_HELPER="$(cat /tmp/geodots_aurhelper)"
BROWSER="$(cat $HOME/GeoDots/Dots/Options/browser)"

PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)"
AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"

codirs="$(curl -s https://geodearc.github.io/GeoDots/configdirs)"
INSTALLED_PKGS=$(pacman -Qq)
PKGS_CONFLICT_LIST="$(curl -s https://geodearc.github.io/GeoDots/pkg-conflicts)"
PKG_CONFLICTS=""

#
# INITIAL
#

clear
echo "Now ready for installation!"
read -p "Press ENTER to begin installation "
clear
echo "Checking for conflicts"


#
# CONFLICT CHECKING
#

for pkg in $PKGS_CONFLICT_LIST; do
    if echo "$INSTALLED_PKGS" | grep -qx "$pkg"; then
        PKG_CONFLICTS+="$pkg "
    fi
done

# has to be done after the original variable, since it changes
PKG_CONFLICTS=$(echo "$PKG_CONFLICTS" | sed 's/\brofi-wayland\b//g' | xargs) # removes false positive since rofi/rofi-wayland are identified by pacman -Qq.

if [[ -z "$PKG_CONFLICTS" ]]; then
    echo "No conflicts found!"
    sleep 1
else
    while true; do
        clear
        echo "Package conflicts found (likely -git packages, these dotfiles install non-git packages):"
        echo $PKG_CONFLICTS
        echo ""
        echo "What would you like to do?"
        echo "1. Remove conflicting packages and proceed to installation"
        echo "2. Modify package lists to allow this package to be used instead (overriding normal packages)"
        echo ""
        read -p " ■ " choice
        case "$choice" in
            1)
                clear
                sudo pacman -Rcns $PKG_CONFLICTS
                break
                ;; 
            2) 
                clear
                echo "Look for similar matches to the packages below (usually without -git), and remove them from the list"
                echo $PKG_CONFLICTS
                echo ""
                echo "You will look inside 4 package lists, once finished editing press CTRL+S then CTRL+X to save/exit."
                read -p "Press ENTER to begin"
                sudo pacman -S --needed nano
                nano $HOME/GeoDots/pkg-pacman
                nano $HOME/GeoDots/pkg-aurs
                nano $HOME/GeoDots/pkg-gtk
                nano $HOME/GeoDots/pkg-qt
                clear
                read -p "Finished, press ENTER to continue"
                PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)"
                AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
                GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
                QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"
                break
                ;;
            *)
                clear
                echo "X Invalid choice. Please try again."
                echo ""
                ;;
        esac
    done
fi

#
# PACMAN PKGS
#


while true; do
    echo "Installing PACMAN packages"
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
        echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
        read -p " ■ " choice
        if [[ "$choice" == "troubleshoot" ]]; then
            clear
            ./Dots/Scripts/Installation/troubleshooter.sh
            PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)" # refresh may be needed
            AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
            GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
            QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"
        fi
        clear
    fi
done

#
# AUR PKGS
#

while true; do
    echo "Installing AUR packages"
    $AUR_HELPER $AUR_PKGS
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
        echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
        read -p " ■ " choice
        if [[ "$choice" == "troubleshoot" ]]; then
            clear
            ./Dots/Scripts/Installation/troubleshooter.sh
            PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)" # refresh may be needed
            AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
            GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
            QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"
        fi
        clear
    fi
done

#
# NAUTILUS TWEAKS (for GTK install)
#

nautilustweak () {
    while true; do
        if pacman -Qq nautilus-admin-gtk4 &>/dev/null; then # Just checking one package because im lazy + it should work.
            echo "Nautilus tweaks installed, skipping"
            sleep 1
            clear
            return
        fi

        echo "Also install nautilus tweaks (copy path, terminal, admin)? [Y/N]"
        read -p " ■ " tweaks
        case "$tweaks" in
            [Yy])
                $AUR_HELPER nautilus-open-any-terminal nautilus-python libnautilus-extension python-gobject
                git clone https://github.com/ronen25/nautilus-copypath
                mkdir -p ~/.local/share/ # yes there are people without .local/share... (mainly minimal installs)
                mkdir -p ~/.local/share/nautilus-python
                mkdir -p ~/.local/share/nautilus-python/extensions
                cd nautilus-copypath
                cp nautilus-copypath.py ~/.local/share/nautilus-python/extensions/
                $AUR_HELPER nautilus-admin-gtk4
                gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
                nautilus -q
                clear
                return
                ;;
            [Nn])
                clear
                return
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}


#
# QT AND GTK PKGS
#

while true; do
    if [[ "$APPTYPE_FILE" == "qt" ]]; then
        echo "Installing QT related packages"
        $AUR_HELPER $QT_PKGS
        if pacman -Qq $QT_PKGS &>/dev/null; then
            clear
            echo "QT Packages installed successfully!"
            read -p "Press Enter when you are ready to move on."
            clear
            break
        else
            echo ""
            echo "WARNING: Installation of QT packages failed or could not be verified."
            echo "Press ENTER for another attempt"
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
                PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)" # refresh may be needed
                AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
                GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
                QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"
            fi
            clear
        fi
    elif [[ "$APPTYPE_FILE" == "gtk" ]]; then
        echo "Installing GTK related packages"
        $AUR_HELPER $GTK_PKGS
        if pacman -Qq $GTK_PKGS &>/dev/null; then
            clear
            nautilustweak
            echo "GTK Packages installed successfully!"
            read -p "Press Enter when you are ready to move on."
            clear
            break
        else
            echo ""
            echo "WARNING: Installation of GTK packages failed or could not be verified."
            echo "Press ENTER for another attempt"
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
                PACMAN_PKGS="$(cat $HOME/GeoDots/pkg-pacman)" # refresh may be needed
                AUR_PKGS="$(cat $HOME/GeoDots/pkg-aurs)"
                GTK_PKGS="$(cat $HOME/GeoDots/pkg-gtk)"
                QT_PKGS="$(cat $HOME/GeoDots/pkg-qt)"
            fi
            clear
        fi
    else
        echo "Warning: App type file not found/invalid. Installing fallback packages, modify hyprland.conf to your specification."
        $AUR_HELPER nautilus gnome-text-editor gnome-software gnome-keyring polkit-gnome kate kwrite dolphin discover kwallet hyprpolkitagent
        break
    fi
done

#
# BROWSER PKGS
#

while true; do
    if pacman -Q $BROWSER &>/dev/null; then
        break
    elif grep Skipped $HOME/GeoDots/Dots/Options/browser &>/dev/null; then
        break
    else
        echo "Installing Browser"
        $AUR_HELPER $BROWSER
        if pacman -Q $BROWSER &>/dev/null; then
            clear
            echo "Browser installed successfully!"
            read -p "Press Enter when you are ready to move on."
            clear
            break
        else 
            echo ""
            echo "WARNING: Installation of Browser failed or could not be verified."
            echo "Press ENTER for another attempt, or type 'skip' to ignore."
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
            fi
            if [[ "$choice" == "skip" ]]; then
                clear
                break
            fi
            clear
        fi
    fi
done

#
# FINAL INSTALL
# 

echo "Packages installed successfully!"
echo "Please save any unsaved documents, as the system will reboot after this is complete!"
read -p "Press enter to copy dotfiles to your system."

xdg-user-dirs-gtk-update

echo "Removing old config/dotfiles folders."
sudo rm -r $HOME/Dots
rm -r $HOME/.zshrc
rm -r $HOME/.bashrc

for dir in $codirs; do
    source="$HOME/.config/$dir"

    if [ -d "$source" ]; then
        echo "Removing $source"
        rm -r "$source"
    else
        echo "Skipping $dir, doesnt exist"
    fi
done

echo "Making temporary cache files for wal"
mkdir -p $HOME/.cache/wal/
mv $HOME/GeoDots/.config/wal/templates/temp/colors-hyprland.conf $HOME/.cache/wal/
mv $HOME/GeoDots/.config/wal/templates/temp/colors-rofi-pywal.rasi $HOME/.cache/wal/
rm $HOME/GeoDots/.config/wal/templates/temp/

cp -r $HOME/GeoDots/.config/hypr/themes/default/hyprland.conf $HOME/GeoDots/.config/hypr/

sudo cp -a $HOME/GeoDots/.config/. $HOME/.config/
mv $HOME/.config/.zshrc $HOME
mv $HOME/.config/.bashrc $HOME

echo "Creating DOTFILES folder (~/Dots)"
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
ln -s $HOME/.cache/wal/colors-rofi-dark.rasi $HOME/.config/rofi/options/colors.rasi
ln -s $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/settings/pywal.css

echo "postinstall" > $HOME/Dots/Options/startup

clear
echo "Congratulations, DOTFILES should be successfully installed!"
echo "A reboot is required for most things to work"
echo ""
echo "Rebooting in 5 seconds, press CTRL+C to abort!"
sleep 5
sudo reboot