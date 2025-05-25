#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

# Current Theme
dir="$HOME/.config/rofi/mode/"
theme='main'

# Options
lmode='☀️'
dmode='🌙'
gmode='🎮️'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER" \
		-mesg "Light | Dark | Minimal" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lmode\n$dmode\n$gmode" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $lmode)
    	$HOME/Dots/Scripts/Themes/light.sh
    	notify-send -i view-reveal-symbolic "Light Mode Active" "You will need to log out to see cursor theme changes."
        ;;
    $dmode)
    	$HOME/Dots/Scripts/Themes/dark.sh
    	notify-send -i view-reveal-symbolic "Dark Mode Active" "You will need to log out to see cursor theme changes."
        ;;
    $gmode)
		$HOME/Dots/Scripts/Themes/game.sh
		notify-send -i applications-games-symbolic "Game Mode Active"
        ;;
esac
