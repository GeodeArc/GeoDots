#!/bin/bash

backup_dir="$HOME/Dots/Backup"
do_backup="false"
codirs="$(curl -s https://geodearc.github.io/GeoDots/configdirs)"
PACMAN_PKGS="$(curl -s https://geodearc.github.io/GeoDots/pkg-pacman)"
AUR_PKGS="$(curl -s https://geodearc.github.io/GeoDots/pkg-aurs)"

BACKUPS=()
if [ -d "$backup_dir" ]; then
    while IFS= read -r -d $'\0' dir; do
        BACKUPS+=("$(basename "$dir")")
    done < <(find "$backup_dir" -mindepth 1 -maxdepth 1 -type d -print0)
fi

BACKUPS+=("Do not restore backup") # adds skip option


backupselect() {
    while true; do
        clear
        echo "Backup/s found. Please choose a restore option, or skip backup restore."
        echo ""

        for i in "${!BACKUPS[@]}"; do
            echo "$((i+1)) - ${BACKUPS[i]}"
        done

        echo ""
        echo "Enter your choice: "
        read -p " ■ " choice

        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#BACKUPS[@]} ]; then
            selected="${BACKUPS[$((choice-1))]}"
            if [ "$selected" == "Do not restore backup" ]; then
                clear
                echo "Skipping backup restore."
                echo
                break
            else
                clear
                backup_dir="$selected"
                do_backup="true"
                break
            fi
        fi
        clear
        echo "X Invalid selection, please try again."
        echo ""
    done
}

backup() {
    if [ ${#BACKUPS[@]} -eq 1 ]; then
        clear
        echo "No backup directories found in $backup_dir"
        echo ""
    else
        backupselect
    fi
}

removedots() {
    while true; do
        echo "Are you sure you want to remove these dotfiles? [Y/N]"
        echo
        echo "Please backup any configurations you would like to keep before this."
        echo "The applications themselves will not be removed, but all configurations for them will."
        echo 
        echo "The following configuration directories will be REMOVED."
        echo "$codirs" 
        echo ""
        echo "Your computer will restart after this option is selected."
        echo "Make sure to backup any important work before doing this."
        echo ""
        read -p " ■ " choice
        case "$choice" in
            [Yy])
                clear
                if [ $do_backup == "true" ]; then                    
                    for dir in $codirs; do
                        source="$HOME/.config/$dir"

                        if [ -d "$source" ]; then
                            echo "Removing $source"
                            sudo rm -r "$source"
                        else
                            echo "Skipping $dir, doesnt exist"
                        fi
                    done

                    cp -r "$HOME/Dots/Backup/$backup_dir/"* "$HOME/.config/"
                    cp "$HOME/Dots/Backup/$backup_dir/.zshrc" /tmp/
                    cp "$HOME/Dots/Backup/$backup_dir/.bashrc" /tmp/

                    echo "Removing ~/Dots"
                    sudo rm -r "$HOME/Dots"

                    mv /tmp/.zshrc ~
                    mv /tmp/.bashrc ~
                else
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

                    echo "Removing ~/Dots"
                    sudo rm -r "$HOME/Dots"
                    sudo rm "$HOME/.zshrc"
                fi
                
                reboot
                break
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
    backup
    removedots
done