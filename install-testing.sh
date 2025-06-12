#!/bin/bash

while true; do
    echo 
    echo "TESTING BRANCH - Use with caution"
    echo 
    echo "It is recommended to update your system before installation."
    echo "Do this now? [Y/N]"
    read -p " ■ " update

    case "$update" in
        y)
                sudo pacman -Syu
                break
                ;;
            Y)
                sudo pacman -Syu
                break
                ;;
            n)
                echo "Skipping!"
                break
                ;;
            N)
                echo "Skipping!"
                break
                ;;
            *)
                clear
                echo "X Invalid choice. Please try again."
                ;;
    esac
done

echo "Installing required depends if needed"
sudo pacman -S --needed git base-devel
clear

cd
echo "Removing previous version if needed"
sudo rm -r GeoDots
clear
echo "Cloning Repo"
git clone -b testing --single-branch https://github.com/GeodeArc/GeoDots
cd GeoDots
./install.sh