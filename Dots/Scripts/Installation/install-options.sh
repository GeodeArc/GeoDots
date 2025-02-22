#!/bin/bash

APPTYPE_FILE="$(cat /tmp/geodots_apptype)"
AUR_HELPER="$(cat /tmp/geodots_aurhelper)"
OLDDM="$(cat /tmp/geodots_olddm)"
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

clear

while true; do
    echo "Would you like primarily QT (KDE) or GTK (GNOME) apps (e.g Nautilus for GTK, Dolphin for QT)"
    echo "Please check the wiki for more info: https://github.com/GeodeArc/GeoDots/wiki/QT-VS-GTK"
    echo ""
    echo "[1]  QT"
    echo "[2]  GTK"
    echo "[3]  What does this mean?"
    echo ""
    read -p " ■ " apptype

    case "$apptype" in
        1)
        echo qt > /tmp/geodots_apptype
        clear
        break
        ;; 
        2)
        echo gtk > /tmp/geodots_apptype
        clear
        break
        ;; 
        3) 
        clear
        echo "Depending on what you choose (GTK or QT), the installer will install different apps based on the two different toolkits, these being GTK and QT."
        echo ""
        echo "In simple terms, some people prefer the way QT looks/operates over how GTK looks/operates, and vice versa. Its all personal preference."
        echo ""
        echo "If you want to see the difference between the two, please check the wiki for more information."
        echo ""
        read -p "Press ENTER to continue: "
        clear
        ;;
        *) 
        clear
        echo "X Please try again."
        echo ""
        ;;
    esac
done

browserselect() {
    while true; do
        local browsers=("firefox" "chromium" "brave" "vivaldi" "google-chrome" "floorp" "librewolf" "epiphany") # Feel free to suggest other browsers I can add here. Doesnt check flatpaks, i know sorry
        for browser in "${browsers[@]}"; do
            if command -v "$browser" >/dev/null 2>&1; then
                echo "$browser browser is already installed, skipping browser installation"
                sleep 1
                clear
                return
            fi
        done
            
        echo "Couldnt find a browser, would you like to install one now?"
        echo ""
        echo "[1]  Firefox"
        echo "[2]  Chromium"
        echo "[3]  Brave"
        echo "[4]  Vivaldi"
        echo "[5]  Other"
        echo "[6]  Skip"
        echo ""
        read -p " ■ " browsertype

        case "$browsertype" in
            1)
            browserinstall "firefox"
            return
            ;; 
            2)
            browserinstall "chromium"
            return
            ;; 
            3) 
            browserinstall "brave-bin"        
            return
            ;;
            4) 
            browserinstall "vivaldi"
            return
            ;;
            5) 
            echo "Please enter the package name for your browser here."
            echo "This installer will NOT check if the package is correct/exists beforehand"
            echo "If you get it wrong, you can always install it later."
            read -p " ■ " browsername
            browserinstall "$browsername"
            return
            ;;
            6) 
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

browserinstall () {
    while true; do
        local browserpackage="$1"
        $AUR_HELPER $browserpackage
        if pacman -Q $browserpackage &>/dev/null; then
            clear
            echo "Browser successfully installed!"
            read -p "Press ENTER to move on: "
            clear
            return
        else
            echo ""
            echo "WARNING: Installation of browser failed or could not be verified."
            echo "Press ENTER for another attempt, or type 'skip' to skip." 
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " browserfail
            if [[ "$browserfail" == "skip" ]]; then
                clear
                return
            fi
            if [[ "$browserfail" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
            fi
            clear
        fi
    done
}

themeconfig() {
    while true; do    
        echo "Do you prefer light theme or dark theme? [L/D]"
        read -p " ■ " lightordark
        
        case "$lightordark" in
            [Ll]) 
            theme="prefer-light"
            gtk_theme="adw-gtk3" 
            ;;
            [Dd]) 
            theme="prefer-dark"
            gtk_theme="adw-gtk3-dark"
            ;;
            *) 
            clear
            echo "X Please try again."
            echo ""
            continue
            ;;
        esac

        echo ""
        sudo pacman -S --needed xdg-desktop-portal xdg-desktop-portal-gnome adw-gtk-theme

        if pacman -Qq xdg-desktop-portal xdg-desktop-portal-gnome adw-gtk-theme &>/dev/null; then
            mkdir -p ~/.config/xdg-desktop-portal/
            echo "[preferred]\ndefault=hyprland;gtk" > ~/.config/xdg-desktop-portal/hyprland-portals.conf
        
            echo "Setting $theme theme"
            gsettings set org.gnome.desktop.interface color-scheme "$theme"
            gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
            clear
            echo "Theme successfully installed!"
            read -p "Press ENTER to move on: "
            clear
            return
        else
            echo ""
            echo "WARNING: Installation of theme dependencies failed or could not be verified."
            echo "Press ENTER for another attempt" 
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " themefail
            if [[ "$themefail" == "troubleshoot" ]]; then
                clear
                ./Dots/Scripts/Installation/troubleshooter.sh
            fi
            clear
        fi
    done
}


checkdm() {
    local dm_changed=0

    while true; do
        if [ -f /etc/systemd/system/display-manager.service ]; then
            echo "You currently appear to have a display manager installed."
            echo ""
            echo "Currently installed (may appear empty for some display managers): $(grep -oP '(?<=ExecStart=/usr/bin/).*' /etc/systemd/system/display-manager.service)"
            echo "Please check the Hyprland Wiki to see if your display manager is compatible."
            echo ""
            echo "Would you like to keep your current setup? (Y/N)"
            echo ""
            read -p " ■ " dminstalled
            case "$dminstalled" in
                [Yy])
                clear
                return
                ;;
                [Nn])
                echo "Removing old display manager(s)..."
                sudo rm /etc/systemd/system/display-manager.service
                clear
                selectdm
                dm_changed=1
                ;;
                *)
                clear
                echo "X Please try again."
                echo ""
                ;;
            esac
        else
            echo "Couldn't find a display manager."
            echo ""
            selectdm
            dm_changed=1
        fi
        if [ "$dm_changed" -eq 1 ]; then
            return
        fi
    done  
}

selectdm() {
    while true; do
        echo "Select a display manager:"
        echo ""
        echo "[1]  SDDM (Recommended)"
        echo "[2]  GDM (Caveat of also installing GNOME)"
        echo "[3]  Autologin with Hyprlock (NOT FINISHED)"
        echo "[4]  None (Not Recommended)"
        echo ""
        read -p " ■ " dmchoice
        case "$dmchoice" in
            1)
            sudo pacman -S --needed sddm qt6-5compat qt6-multimedia
            sudo systemctl enable sddm
            if pacman -Q sddm qt6-5compat qt6-multimedia &>/dev/null; then
                clear
                echo "Installing SDDM theme:"
                sudo cp -r $HOME/GeoDots/.config/sddm/win11-sddm-theme /usr/share/sddm/themes
                sudo cp $HOME/GeoDots/.config/sddm/default.conf /usr/lib/sddm/sddm.conf.d/
                sudo mkdir -p /etc/sddm.conf.d # just incase
                sudo rm /etc/sddm.conf.d/kde_settings.conf # this takes precedence over regular sddm config, so this will remove it.
                sudo cp $HOME/GeoDots/.config/sddm/default.conf /etc/sddm.conf.d/ # just incase
                return
            else
                echo ""
                echo "WARNING: Installation of display manager failed or could not be verified."
                echo "Press ENTER for another attempt, or type 'skip' to skip." 
                echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
                read -p " ■ " dmfail
                if [[ "$dmfail" == "skip" ]]; then
                    clear
                    return
                fi
                if [[ "$dmfail" == "troubleshoot" ]]; then
                    clear
                    ./Dots/Scripts/Installation/troubleshooter.sh
                fi
                clear
            fi
            ;;
            2)
            sudo pacman -S --needed gdm
            sudo systemctl enable gdm
            if pacman -Q gdm &>/dev/null; then
                clear
                return
            else
                echo ""
                echo "WARNING: Installation of display manager failed or could not be verified."
                echo "Press ENTER for another attempt, or type 'skip' to skip." 
                echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
                read -p " ■ " dmfail
                if [[ "$dmfail" == "skip" ]]; then
                    clear
                    return
                fi
                if [[ "$dmfail" == "troubleshoot" ]]; then
                    clear
                    ./Dots/Scripts/Installation/troubleshooter.sh
                fi
                clear
            fi
            ;;
            3)
            clear
            echo "true" > $HOME/GeoDots/Dots/Options/autologin
            echo ""
            ;;
            4)
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

chaoticinstall () {
    while true; do
        if grep chaotic-aur /etc/pacman.conf &>/dev/null; then
            return
        else
            echo "Chaotic AUR can be used to install AUR packages a lot faster."
            echo "Install/setup Chaotic-AUR? [Y/N]"
            echo ""
            echo "This may take awhile, dont worry if you are stuck here for a bit"
            echo ""
            read -p " ■ " chaotic
            
            case "$chaotic" in
                [Yy])
                sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
                sudo pacman-key --lsign-key 3056513887B78AEB

                sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
                sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
                
                if pacman -Qq chaotic-keyring chaotic-mirrorlist &>/dev/null; then
                    echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
                    sudo pacman -Sy
                    clear
                    return
                else
                    echo ""
                    echo "WARNING: Installation of chaoticaur failed or could not be verified."
                    echo "Press ENTER for another attempt, or type 'skip' to skip." 
                    echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
                    read -p " ■ " chaoticfail
                    if [[ "$chaoticfail" == "skip" ]]; then
                        clear
                        return
                    fi
                    if [[ "$chaoticfail" == "troubleshoot" ]]; then
                        clear
                        ./Dots/Scripts/Installation/troubleshooter.sh
                     fi
                    clear
                fi
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
        fi
    done
}

backup () {
    while true; do
        echo "Would you like to backup existing config folders? [Y/N]"
        read -p " ■ " dobackup
        case "$dobackup" in
                [Yy])
                backupdir="$HOME/GeoDots/Dots/Backup/$(date +'%Y-%m-%d-%H:%M:%S')"
                mkdir -p "$backupdir"
                cp -a "$HOME/.zshrc" "$backupdir"
                cp -a "$HOME/.bashrc" "$backupdir" 
                for dir in "${DIRS[@]}"; do
                    if [ -d "$dir" ]; then
                        echo "Backing up $dir"
                        cp -a "$dir" "$backupdir/"
                    else
                        echo "Skipping $dir"
                    fi
                done
                clear
                exit 0
                ;;
                [Nn])
                clear
                exit 0
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
    browserselect
    themeconfig
    checkdm
    chaoticinstall
    backup
done