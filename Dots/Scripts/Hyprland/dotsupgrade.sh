#!/bin/bash

curver="$(cat $HOME/Dots/Options/currentver)"
newver="$(curl -s https://geodearc.github.io/GeoDots/version)"
dirs="$(curl -s https://geodearc.github.io/GeoDots/dirs)"

echo "Current Dotfiles Version: $curver"
echo "New Dotfiles Version: $newver"
echo ""
echo "$dirs"


upgrade () {
    while true; do
        echo "Would you like to backup existing config folders? [Y/N]"
        read -p " ■ " dobackup
        case "$dobackup" in
                [Yy])
                backupdir="$HOME/Dots/Backup/$(date +'%Y-%m-%d-%H:%M:%S')"
                mkdir -p "$backupdir"
                cp -a "$HOME/.zshrc" "$backupdir"
                cp -a "$HOME/.bashrc" "$backupdir" 
                for dir in "${dirs[@]}"; do
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

if [[ $curver != $newver ]]; then
  echo "New version available!"
  echo ""
  echo "Press ENTER to continue "
  read -p " ■ " upgrade
  clear
  upgrade
else
  echo "No new version seems to available."
  echo "If you believe this is incorrect, please check your internet connection."
  echo ""
  echo "Press ENTER to exit"
  read -p " ■ "
fi