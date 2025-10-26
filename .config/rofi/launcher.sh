#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

stlconf="$(cat $HOME/Dots/Options/style)"
thmconf="$(cat $HOME/Dots/Options/theme)"
launcher="$(cat $HOME/Dots/Options/launchertype)"

config="$stlconf"
theme="$thmconf"

dir="$HOME/.config/rofi/$config/$theme/launcher"
mode="$launcher"

## Run
rofi \
    -show drun \
    -theme ${dir}/${mode}.rasi
