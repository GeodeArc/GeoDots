#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

# Import Current Theme
rofidir="$HOME/.config/rofi/screenshot/"
theme="main"

timer="$(cat "$HOME/.config/rofi/screenshot/options/timer")"
freeze="$(cat "$HOME/.config/rofi/screenshot/options/freeze")"

# Options
option_1="󰹑"
option_2=""
option_3="󱊅"
option_4=""

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${rofidir}/${theme}.rasi \
		-p " $USER" \
		-mesg "Monitor | Window | Selection | Settings" 
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}	

# take shots
shotscreen () {
	$timer
	hyprshot -m output -o ~/Pictures/Screenshots -f Screenshot_$(date "+%Y-%m-%d_%H:%M:%S").png $freeze
}

shotwin () {
	$timer
	hyprshot -m window -o ~/Pictures/Screenshots -f Screenshot_$(date "+%Y-%m-%d_%H:%M:%S").png $freeze
}

shotarea () {
	$timer
	hyprshot -m region -o ~/Pictures/Screenshots -f Screenshot_$(date "+%Y-%m-%d_%H:%M:%S").png $freeze
}
settings () {
	$HOME/.config/rofi/screenshot-settings.sh
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		sleep 1
		shotscreen
	elif [[ "$1" == '--opt2' ]]; then
		sleep 1
		shotwin
	elif [[ "$1" == '--opt3' ]]; then
		sleep 1
		shotarea
	elif [[ "$1" == '--opt4' ]]; then
		settings	
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
    $option_4)
    	run_cmd --opt4
        ;;
esac
