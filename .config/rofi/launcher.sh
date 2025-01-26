#!/usr/bin/env bash

##
## Original Author : Aditya Shakya (adi1090x)
## Original Github : @adi1090x
## Adapted by : @GeodeArc
##

dir="$HOME/.config/rofi/launcher"
theme='vertical'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
