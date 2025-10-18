#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

stlconf="$(cat $HOME/Dots/Options/style)"
thmconf="$(cat $HOME/Dots/Options/theme)"

config="$stlconf"
theme="$thmconf"

dir="$HOME/.config/rofi/$config/$theme/screenshot"
mode='timer'

# Options
option_1="0s"
option_2="3s"
option_3="5s"
option_4="10s"
option_5="30s"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${mode}.rasi \
		-p " $USER"
}

run_rofi () {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}	

shot () {
	echo "sleep $seconds" > $HOME/.config/rofi/options/screenshot/timer
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		seconds="0"
		shot 
	elif [[ "$1" == '--opt2' ]]; then
		seconds="3"
		shot 
	elif [[ "$1" == '--opt3' ]]; then
		seconds="5"
		shot 
	elif [[ "$1" == '--opt4' ]]; then
		seconds="10"
		shot 
	elif [[ "$1" == '--opt5' ]]; then
		seconds="30"
		shot 
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
    $option_5)
		run_cmd --opt5
        ;;
esac
