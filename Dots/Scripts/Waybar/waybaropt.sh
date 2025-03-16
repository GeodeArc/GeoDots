#!/bin/bash

theme="$(cat "$HOME/Dots/Options/theme" | tr -d '\n')"

if grep -q "main" "$HOME/.config/waybar/type"; then
	echo "alt" > $HOME/.config/waybar/type  
	cp $HOME/.config/waybar/configs/alt/$theme/config.jsonc $HOME/.config/waybar
	cp $HOME/.config/waybar/configs/alt/$theme/style.css $HOME/.config/waybar
elif grep -q "alt" "$HOME/.config/waybar/type"; then
	echo "main" > $HOME/.config/waybar/type   
	cp $HOME/.config/waybar/configs/$theme/config.jsonc $HOME/.config/waybar
	cp $HOME/.config/waybar/configs/$theme/style.css $HOME/.config/waybar
fi

killall waybar
waybar