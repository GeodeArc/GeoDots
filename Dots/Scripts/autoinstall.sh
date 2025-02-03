#!/bin/bash

echo "It is recommended to update your system before installation."
echo "Do this now? [Y/N]"
read -p " ■ " update

case "$update" in
	y)
            sudo pacman -Syu
            ;;
        Y)
            sudo pacman -Syu
            ;;
        n)
            echo "Skipping!"
            ;;
        N)
            echo "Skipping!"
            ;;
        *)
            clear
            echo "X Invalid choice. Please try again."
            echo ""
            ;;
esac

sudo pacman -S --needed git base-devel

cd
git clone https://github.com/GeodeArc/GeoDots
cd GeoDots
./install.sh
