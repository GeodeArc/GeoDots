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
        ;;
    $dmode)
    	$HOME/Dots/Scripts/Themes/dark.sh
        ;;
    $gmode)
		$HOME/Dots/Scripts/Themes/game.sh
        ;;
esac
