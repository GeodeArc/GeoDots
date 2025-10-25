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

dir="$HOME/.config/rofi/$config/$theme/mode"
mode='main'

# Options
modstl='✨️'
colstl='🌈'
minstl='👾'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER" \
		-mesg "Modern | Colorful | Minimal" \
		-theme ${dir}/${mode}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$modstl\n$colstl\n$minstl" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $modstl)
    	$HOME/Dots/Scripts/Themes/s-mod.sh
    	notify-send -i preferences-color-symbolic "Modern Theme Active" "You may need to log out for all settings to apply."
        ;;
    $colstl)
    	$HOME/Dots/Scripts/Themes/s-col.sh
    	notify-send -i preferences-color-symbolic "Colorful Theme Active" "You may need to log out for all settings to apply."
        ;;
    $minstl)
    	$HOME/Dots/Scripts/Themes/s-min.sh
    	notify-send -i preferences-color-symbolic "Minimal Theme Active" "You may need to log out for all settings to apply."
        ;;
esac
