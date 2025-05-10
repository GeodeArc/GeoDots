#!/bin/bash

while true; do
    echo ""
    echo "TESTING BRANCH - MAY ENCOUNTER PROBLEMS!"
    echo ""
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

sudo pacman -S --needed git base-devel

cd
git clone https://github.com/GeodeArc/GeoDots
cd GeoDots
./install.sh