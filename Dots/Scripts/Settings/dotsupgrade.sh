#!/bin/bash

curver="$(cat $HOME/Dots/Options/currentver)"
newver="$(curl -s https://geodearc.github.io/GeoDots/version)"
codirs="$(curl -s https://geodearc.github.io/GeoDots/dirs)"
directory="$HOME/.config"

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
                backupdir="$HOME/Dots/Backup/$(date +'%Y-%m-%d-%H:%M:%S')"

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

upgrade() {
    read -p "This utility isnt finished. Press ENTER to return."
}

if [[ $curver != $newver ]]; then
    echo "New version available!"
    echo ""
    echo "Press ENTER to continue "
    read -p " ■ "
    clear
    backup
    upgrade
else
    echo "No new version seems to available."
    echo "If you believe this is incorrect, please check your internet connection."
    echo ""
    echo "Press ENTER to exit"
    read -p " ■ "
fi