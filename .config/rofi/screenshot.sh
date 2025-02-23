#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

# Import Current Theme
rofidir="$HOME/.config/rofi/screenshot/"
theme="main"

# Options
option_1="󰹑"
option_2=""
option_3="󱊅"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${rofidir}/${theme}.rasi \
		-p " $USER" \
		-mesg "Monitor | Window | Selection" 
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}	

# take shots
shotscreen () {
	hyprshot -m output -o ~/Pictures/Screenshots -f Screenshotﾠ$(date "+%Y-%m-%dﾠ%H:%M:%S").png
}

shotwin () {
	hyprshot -m window -o ~/Pictures/Screenshots -f Screenshotﾠ$(date "+%Y-%m-%dﾠ%H:%M:%S").png
}

shotarea () {
	hyprshot -m region -o ~/Pictures/Screenshots -f Screenshotﾠ$(date "+%Y-%m-%dﾠ%H:%M:%S").png
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		sleep 0.5
		shotscreen
	elif [[ "$1" == '--opt2' ]]; then
		sleep 0.5
		shotwin
	elif [[ "$1" == '--opt3' ]]; then
		sleep 0.5
		shotarea
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
esac
