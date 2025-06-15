#!/bin/bash

STATE_FILE="/tmp/geodots_skipchecks"
AUR_FILE="/tmp/geodots_aurhelper"

codirs="$(curl -s https://geodearc.github.io/GeoDots/configdirs)"
otherdots=(
    "$HOME/Dotfiles"
    "$HOME/dotfiles"
    "$HOME/dots"
)

#
# AUR HELPER INSTALLATION
#

aurinstall() {
    while true; do
        if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
            echo "Check skipping enabled!"
        else
            if pacman -Qq yay &>/dev/null; then
                echo "AUR helper (yay) already installed. Skipping this step."
                echo "yay -Sy --needed" > "$AUR_FILE"
                sleep 1
                clear
                return
            fi
            if pacman -Qq paru &>/dev/null; then
                echo "AUR helper (paru) already installed. Skipping this step."
                echo "paru -Sy --needed" > "$AUR_FILE"
                sleep 1
                clear
                return
            fi
        fi

        echo "An AUR helper is needed for installation. Please pick either yay or paru, or specify one."
        echo ""
        echo "yay is a simple/lightweight AUR helper known for its simplicity. Some of the defaults it has can be confusing."
        echo "paru is a feature rich/lightweight AUR helper known for good defaults/user experience. It will take longer to install due to Rust."
        echo "You can always install another aur helper at any time after installation, dont feel locked into one."
        echo ""
        echo "▶  [1] yay"
        echo "▶  [2] paru"
        echo "◆  [3] I have another AUR helper id like to use"
        echo ""
        read -p "Please choose an option [1-3] " aurhelper

        case "$aurhelper" in
                1)
                    clear
                    install_aur_helper "yay" "https://aur.archlinux.org/yay"
                    if [[ $? -eq 0 ]]; then # checks for return 0
			            return
		            fi
                    ;;
                2)
                    clear
                    install_aur_helper "paru" "https://aur.archlinux.org/paru"
                    if [[ $? -eq 0 ]]; then # checks for return 0
			            return
		            fi
                    ;;
                3)
                    clear
                    custom_aur_helper
                    if [[ $? -eq 0 ]]; then # checks for return 0
			            return
		            fi 
                    ;;
                *)
                    clear
                    echo "X Invalid choice. Please try again."
                    echo ""
                    ;;
        esac
    done
}

install_aur_helper() {
    while true; do
        local aurh_name="$1"
        local aurh_url="$2"
        
        clear
        echo "Checking if dependencies are met"
        sudo pacman -Sy --needed git base-devel

        if pacman -Q git base-devel &>/dev/null; then
            echo "Dependencies installed."
        else
            echo ""
            echo "WARNING: Installation of dependencies failed or could not be verified."
            echo "Press ENTER for another attempt" 
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice

            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                cd $HOME/GeoDots/Dots/Scripts/Installation/
                ./troubleshooter.sh
            fi
            clear
            return 1
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
            echo "$aurh_name -Sy --needed" > "$AUR_FILE"
            sudo rm -r $HOME/$aurh_name
            read -p "Press Enter when you are ready to move on."
            clear
            return 0
        else
            echo ""
            echo "WARNING: Installation of AUR helper failed or could not be verified."
            echo "Press ENTER for another attempt" 
            echo "Alternatively, type 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice

            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                echo "Running troubleshooter..."
                cd $HOME/GeoDots/Dots/Scripts/Installation/ # weird af but i gotta do it.
                ./troubleshooter.sh
            fi
            clear
            return 1
        fi
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
            return 1
        fi

        if [[ -n "$customaur" ]]; then
            echo "Setting $customaur as AUR helper"
            echo $customaur > "$AUR_FILE"
            echo ""
            echo "Press ENTER to continue, or 'back' if you made a mistake"
            read -p " ■ " finalaurcheck
            if [[ "$finalaurcheck" == "back" ]]; then
                clear
                continue
            fi
            clear
            return 0
        else
            clear
            echo "X Please try again."
            echo ""
        fi
    done
}

#
# FONT INSTALLATION
#

fontinstall() {
    while true; do
        if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
            echo "Check skipping enabled!"
        else
            if pacman -Qq $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") &>/dev/null; then
                echo "Noto fonts already installed. Skipping this step."
                sleep 1
                clear
                return
            fi
        fi

        echo "Couldnt find any/all noto-fonts, would you like to install them?"
        echo "This will ensure that you have most languages/symbols/emojis installed."
        echo ""
        echo "This will be a pretty large download, but id recommend it if you have the space."
        echo ""
        echo "Enter your choice [Y/N]"
        read -p " ■ " notofont

        case "$notofont" in
            [Yy]) 
                install_noto_font
                if [[ $? -eq 0 ]]; then # checks for return 0
			        return
		        fi
                ;;
            [Nn]) 
                echo "Skipping!"
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

install_noto_font() {
    while true; do
        echo "Installing noto fonts..."
        sudo pacman -Sy --needed $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") # In case of chaotic AUR users

        if pacman -Qq $(pacman -Ssq noto-fonts | grep -v "^noto-fonts-emoji-flag-git") &>/dev/null; then
            clear
            echo "Fonts are installed!"
            read -p "Press Enter when you are ready to move on."
            clear
            return 0
        else
            echo ""
            echo "WARNING: Installation of nerd font failed or could not be verified."
            echo "Press ENTER to return to the main menu for another attempt"
            echo "Alternatively, type 'skip' to skip, or 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "skip" ]]; then
                clear
                return 0
            fi
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                cd $HOME/GeoDots/Dots/Scripts/Installation/
                ./troubleshooter.sh
            fi
            clear
            return 1
        fi
    done
}

#
# NERD FONT INSTALLATION
# CURRENTLY DEPRECATED
#

install_nerd_font() { # disabled for now until font choice is complete
    local font_name="$1"
    local font_pkg="$2"

    echo "Installing $font_name..."
    sudo pacman -Sy --needed "$font_pkg"

    if pacman -Qq $(pacman -Ssq $font_pkg) &>/dev/null; then
            clear
            echo "Fonts installed successfully!"
            read -p "Press Enter when you are ready to move on."
            return
        else
            echo ""
            echo "WARNING: Installation of nerd font failed or could not be verified."
            echo "Press ENTER to return to the main menu for another attempt"
            echo "Alternatively, type 'skip' to skip, or 'troubleshoot' to run the troubleshooter"
            read -p " ■ " choice
            if [[ "$choice" == "skip" ]]; then
                return
            fi
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                cd $HOME/GeoDots/Dots/Scripts/Installation/
                ./troubleshooter.sh
            fi
            clear
            return
        fi
}

nerdinstall() { # disabled for now until font choice is complete
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
                ;;
            2)
                clear
                install_nerd_font "Hack" "ttf-hack-nerd"
                ;;
            3)
                clear
                install_nerd_font "FiraCode" "ttf-firacode-nerd"
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
                return
                ;;
            5)
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

#
# TOOLKIT SELECTION
#

toolkitselect () {
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
                echo -e "\$fileManager = dolphin \n\$textEditor = kwrite \n\$polkitAgent = hyprpolkitagent" | sudo tee $HOME/GeoDots/.config/hypr/config/apptype.conf
                clear
                break
                ;; 
            2)
                echo gtk > /tmp/geodots_apptype
                echo -e "\$fileManager = nautilus --new-window \n\$textEditor = gnome-text-editor --new-window \n\$polkitAgent = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" | sudo tee $HOME/GeoDots/.config/hypr/config/apptype.conf
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
}

#
# BROWSER SELECTION
#

browserselect() {
    while true; do
        local browsers=("firefox" "chromium" "brave" "vivaldi" "google-chrome" "floorp" "librewolf" "epiphany") # Feel free to suggest other browsers I can add here. Doesnt check flatpaks, i know sorry

        if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
            echo "Check skipping enabled!"
        else
            for browser in "${browsers[@]}"; do
                if command -v "$browser" >/dev/null 2>&1; then # command instead of pacman, because different versions of packages.
                    echo "$browser browser is already installed, skipping browser installation"
                    echo "$browser" > $HOME/GeoDots/Dots/Options/browser
                    sleep 1
                    clear
                    return
                fi
            done
        fi
            
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
                echo "firefox" > $HOME/GeoDots/Dots/Options/browser
                clear
                return
                ;; 
            2)
                echo "chromium" > $HOME/GeoDots/Dots/Options/browser
                clear
                return
                ;; 
            3)   
                echo "brave" > $HOME/GeoDots/Dots/Options/browser
                clear
                return
                ;;
            4) 
                echo "vivaldi" > $HOME/GeoDots/Dots/Options/browser
                clear
                return
                ;;
            5) 
                echo "Please enter the package name for your browser here."
                echo "This installer will NOT check if the package is correct/exists beforehand"
                echo "If you get it wrong, you can always install it later."
                read -p " ■ " browsername
                browserinstall "$browsername"
                echo "$browsername" > $HOME/GeoDots/Dots/Options/browser
                return
                ;;
            6) 
                echo "Skipped during install - Clear this line and add your browser's command here for SUPER+B to open your browser." > $HOME/GeoDots/Dots/Options/browser
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
# THEME SELECTION
#

themeconfig() {
    while true; do    
        echo "Do you prefer light theme or dark theme? [L/D]"
        read -p " ■ " lightordark
        
        case "$lightordark" in
            [Ll]) 
                theme="prefer-light"
                gtk_theme="adw-gtk3"
                cursor_theme="Bibata-Modern-Ice" 
                #kvantum_theme
                type="light"
                ;;
            [Dd]) 
                theme="prefer-dark"
                gtk_theme="adw-gtk3-dark"
                cursor_theme="Bibata-Modern-Classic"
                #kvantum_theme
                type="dark"
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

        if pacman -Q xdg-desktop-portal xdg-desktop-portal-gnome adw-gtk-theme &>/dev/null; then
            mkdir -p ~/.config/xdg-desktop-portal/
            echo "[preferred]\ndefault=hyprland;gtk" > ~/.config/xdg-desktop-portal/hyprland-portals.conf
        
            echo "Setting $theme theme"
            gsettings set org.gnome.desktop.interface color-scheme "$theme"
            gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
            gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"
            echo "$type" > $HOME/GeoDots/Dots/Options/theme

            echo -e "\$cursortheme = $cursor_theme" | sudo tee $HOME/GeoDots/.config/hypr/config/cursortheme.conf

            cp -a $HOME/GeoDots/.config/waybar/configs/$type/. $HOME/GeoDots/.config/waybar/
            cp -a $HOME/GeoDots/.config/swaync/themes/$type/. $HOME/GeoDots/.config/swaync/
            cp -a $HOME/GeoDots/.config/rofi/options/$type/. $HOME/GeoDots/.config/rofi/
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
            read -p " ■ " choice
            if [[ "$choice" == "troubleshoot" ]]; then
                clear
                cd $HOME/GeoDots/Dots/Scripts/Installation/
                ./troubleshooter.sh
            fi
            clear
        fi
    done
}

#
# DISPLAY MANAGER INSTALLATION
#

checkdm() {
    local dm_changed=0

    while true; do
        if [ -f /etc/systemd/system/display-manager.service ]; then
            echo "You currently appear to have a display manager installed."
            echo ""
            echo "Currently installed: $(grep -oP '(?<=ExecStart=/usr/bin/).*' /etc/systemd/system/display-manager.service)"
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

mainsddm() {
    echo "Installing SDDM theme:"
    sudo tar -xf $HOME/GeoDots/.config/sddm/theme/sddm-astronaut-theme.tar.xz -C /usr/share/sddm/themes
    sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
    echo -e "[Theme]\nCurrent=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

    sudo cp -r $HOME/GeoDots/Dots/Wallpapers/wall1.jpg /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/wallpaper.jpg
    mv $HOME/GeoDots/.config/sddm/update_sddm.sh $HOME/GeoDots/Dots/Scripts/Themes
    rm -r $HOME/GeoDots/.config/sddm/
}

sddmtheme() {
    while true; do
        echo "Please select an SDDM theme"
        echo "You can preview these themes at https://github.com/GeodeArc/GeoDots/wiki/SDDM-Themes"
        echo ""
        echo "[1] Centered"
        echo "[2] Centered blur"
        echo "[3] Left blur"
        echo "[4] Right blur"
        echo "[5] Windows 11 theme"
        echo ""
        read -p " ■ " dmtheme
        case "$dmtheme" in
            1)
                clear
                mainsddm
                echo -e "ConfigFile=Themes/center.conf" | sudo tee -a /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
                return
                ;;
            2)
                clear
                mainsddm
                echo -e "ConfigFile=Themes/centerblur.conf" | sudo tee -a /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
                return
                ;;
            3)
                clear
                mainsddm
                echo -e "ConfigFile=Themes/leftblur.conf" | sudo tee -a /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
                return
                ;;
            4)
                clear
                mainsddm
                echo -e "ConfigFile=Themes/rightblur.conf" | sudo tee -a /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
                return
                ;;
            5)
                clear
                echo "Installing SDDM theme:"
                sudo tar -xf $HOME/GeoDots/.config/sddm/theme/win11-sddm-theme.tar.xz -C /usr/share/sddm/themes
                sudo cp -r /usr/share/sddm/themes/win11-sddm-theme/Fonts/* /usr/share/fonts/
                echo -e "[Theme]\nCurrent=win11-sddm-theme" | sudo tee /etc/sddm.conf

                sudo mkdir -p /usr/share/sddm/themes/win11-sddm-theme/Backgrounds/
                sudo cp -r $HOME/GeoDots/Dots/Wallpapers/wall1.jpg /usr/share/sddm/themes/win11-sddm-theme/Backgrounds/wallpaper.jpg
                mv $HOME/GeoDots/.config/sddm/update_sddm.sh $HOME/GeoDots/Dots/Scripts/Themes
                rm -r $HOME/GeoDots/.config/sddm/
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

selectdm() {
    while true; do
        echo "Select a display manager:"
        echo ""
        echo "[1]  SDDM (Recommended)"
        echo "[2]  GDM (Caveat of also installing GNOME)"
        echo "[3]  Hyprlock on Login (No display manager)"
        echo "[4]  None (Not Recommended)"
        echo ""
        read -p " ■ " dmchoice
        case "$dmchoice" in
            1)
                sudo pacman -S --needed sddm qt6-5compat qt6-multimedia
                sudo systemctl enable sddm
                if pacman -Q sddm qt6-5compat qt6-multimedia &>/dev/null; then
                    clear
                    sddmtheme
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
                        cd $HOME/GeoDots/Dots/Scripts/Installation/
                        ./troubleshooter.sh
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
                        ./troubleshooter.sh
                    fi
                    clear
                fi
                ;;
            3)
                echo "enabled" > $HOME/GeoDots/Dots/Options/autologin
                clear
                return
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

#
# CHAOTIC AUR INSTALLATION
#

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
                    
                    if pacman -Q chaotic-keyring chaotic-mirrorlist &>/dev/null; then
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
                            cd $HOME/GeoDots/Dots/Scripts/Installation/
                            ./troubleshooter.sh
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

#
# BACKUP
#

backup () {
    while true; do
        echo "Would you like to backup existing config folders? [Y/N]"
        read -p " ■ " dobackup
        case "$dobackup" in
                [Yy])
                    backupdir="$HOME/GeoDots/Dots/Backup/$(date +'%Y-%m-%d-%H:%M:%S')"
                    directory="$HOME/.config"

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
    aurinstall
    fontinstall
    #nerdinstall (disabled for now - havent properly implemented font selection yet)
    toolkitselect
    browserselect
    themeconfig
    checkdm
    chaoticinstall
    backup

    echo "Getting latest Dotfiles package list - Please wait"
    curl -o $HOME/GeoDots/pkg-pacman -s https://geodearc.github.io/GeoDots/pkg-pacman
    curl -o $HOME/GeoDots/pkg-aurs -s https://geodearc.github.io/GeoDots/pkg-aurs
    curl -o $HOME/GeoDots/pkg-gtk -s https://geodearc.github.io/GeoDots/pkg-gtk
    curl -o $HOME/GeoDots/pkg-qt -s https://geodearc.github.io/GeoDots/pkg-qt
    exit 0
done