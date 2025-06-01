#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

# Import Current Theme
rofidir="$HOME/.config/rofi/screenshot/"
theme="settings"

# Options
option_1=""
option_2="󱎫"
option_3="󱤳"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${rofidir}/${theme}.rasi \
		-p " $USER" \
		-mesg "Back | Toggle Timer | Toggle Freeze" 
}

run_rofi () {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}	

# Add timer
timer () {
	$HOME/.config/rofi/screenshot-timer.sh
	$HOME/.config/rofi/screenshot.sh
}

# Freeze screen options
freeze () {
	if grep -q "true" "$HOME/Dots/Options/screenshot"; then
		notify-send -i applets-screenshooter-symbolic "Disabled Screenshot Freeze"
		echo "false" > $HOME/Dots/Options/screenshot
		echo "" > $HOME/.config/rofi/screenshot/options/freeze 
	else 
		notify-send -i applets-screenshooter-symbolic "Enabled Screenshot Freeze" "This may not work on virtual machines"
		echo "true" > $HOME/Dots/Options/screenshot
		echo "-z" > $HOME/.config/rofi/screenshot/options/freeze
	fi
	$HOME/.config/rofi/screenshot.sh
}

back() {
	$HOME/.config/rofi/screenshot.sh
}


# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		back
	elif [[ "$1" == '--opt2' ]]; then
		timer
	elif [[ "$1" == '--opt3' ]]; then
		freeze
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
