#!/bin/bash

echo "Current themes:"
ls ~/.config/swaync/themes
echo ""
read -p "Please pick a theme: " theme
find ~/.config/swaync -maxdepth 1 -type f -delete
cp -r ~/.config/swaync/themes/$theme/* ~/.config/swaync
