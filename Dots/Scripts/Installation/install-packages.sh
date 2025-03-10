#!/bin/bash

APPTYPE_FILE="$(cat /tmp/geodots_apptype)"
AUR_HELPER="$(cat /tmp/geodots_aurhelper)"

PACMAN_PKGS="$(cat $HOME/GeoDots/Dots/Scripts/Installation/pkgs/pkg-pacman)"
AUR_PKGS="$(cat $HOME/GeoDots/Dots/Scripts/Installation/pkgs/pkg-aurs)"
GTK_PKGS="$(cat $HOME/GeoDots/Dots/Scripts/Installation/pkgs/pkg-gtk)"
QT_PKGS="$(cat $HOME/GeoDots/Dots/Scripts/Installation/pkgs/pkg-qt)"
DIRS=(
    "$HOME/Dots"
    "$HOME/dofiles"
    "$HOME/Dotfiles"
    "$HOME/.config/hypr"
    "$HOME/.config/kitty"
    "$HOME/.config/rofi"
    "$HOME/.config/swaync"
    "$HOME/.config/wal"
    "$HOME/.config/waybar"
    "$HOME/.config/waypaper"
)
CODIRS=(
    "$HOME/.config/hypr"
    "$HOME/.config/kitty"
    "$HOME/.config/rofi"
    "$HOME/.config/swaync"
    "$HOME/.config/wal"
    "$HOME/.config/waybar"
    "$HOME/.config/waypaper"
)

echo "Now ready for installation!"
read -p "Press ENTER to begin installation "

#echo "Checking for package conflicts."
# ADD LATER MAYBE

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
        fi
        clear
    fi
done

while true; do
    echo "Installing AUR packages"
    $AUR_HELPER $AUR_PKGS
    cp $HOME/GeoDots/.config/hypr/temp/qt/hyprland.conf $HOME/GeoDots/.config/hypr/
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
        fi
        clear
    fi
done

nautilustweak () {
    while true; do
        echo "Also install nautilus tweaks (copy path, terminal, admin)? [Y/N]"
        read -p " ■ " tweaks
        case "$tweaks" in
            [Yy])
                $AUR_HELPER nautilus-open-any-terminal nautilus-python libnautilus-extension python-gobject
                git clone https://github.com/ronen25/nautilus-copypath
                mkdir ~/.local/share/nautilus-python
                mkdir ~/.local/share/nautilus-python/extensions
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

while true; do
    if [[ "$APPTYPE_FILE" == "qt" ]]; then
        $AUR_HELPER $QT_PKGS
        cp $HOME/GeoDots/.config/hypr/temp/qt/hyprland.conf $HOME/GeoDots/.config/hypr/
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
            fi
            clear
        fi
    elif [[ "$APPTYPE_FILE" == "gtk" ]]; then
        $AUR_HELPER $GTK_PKGS
        cp $HOME/GeoDots/.config/hypr/temp/gtk/hyprland.conf $HOME/GeoDots/.config/hypr/
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
            fi
            clear
        fi
        return
    else
        echo "Warning: App type file not found/invalid. Installing fallback packages, modify hyprland.conf to your specification."
        $AUR_HELPER nautilus gnome-text-editor gnome-software gnome-keyring polkit-gnome kate kwrite dolphin discover kwallet hyprpolkitagent
        break
    fi
done

echo "Packages installed successfully!"
echo "Please save any unsaved documents, as the system will reboot after this is complete!"
read -p "Press enter to copy dotfiles to your system."

xdg-user-dirs-gtk-update

echo "Copying configs to config folders."
for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Removing $dir"
        rm -rf "$dir"
    fi
done

sudo cp -a $HOME/GeoDots/.config/. $HOME/.config/
mv $HOME/.config/.zshrc $HOME
mv $HOME/.config/.bashrc $HOME

echo "Creating DOTFILES folder (~/Dots)"
cp -a $HOME/GeoDots/Dots $HOME/Dots

echo "Creating symlinks from .config to Dots folder"
for dir in "${CODIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Creating symlink $dir"
        ln -s $dir $HOME/Dots/Config/
    fi
done

echo "Generating default color scheme:"
wal -i "$HOME/Dots/Wallpapers/wall1.jpg"
ln -s $HOME/.cache/wal/colors-hyprland.conf $HOME/.config/hypr/colors.conf
ln -s $HOME/.cache/wal/colors-rofi-pywal.rasi $HOME/.config/rofi/options/colors.rasi
ln -s $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/settings/pywal.css

echo "Making temporary cache files for wal"
mkdir -p $HOME/.cache/wal/
mv $HOME/GeoDots/.config/wal/colors-hyprland.conf $HOME/.cache/wal/
mv $HOME/GeoDots/.config/wal/colors-rofi-pywal.rasi $HOME/.cache/wal/

echo "postinstall" > $HOME/Dots/Options/startup

clear
echo "Congratulations, DOTFILES should be successfully installed!"
echo "A reboot is required for most things to work"
echo ""
echo "Rebooting in 5 seconds, press CTRL+C to abort!"
sleep 5
sudo reboot