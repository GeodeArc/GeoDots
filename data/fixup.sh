#!/bin/bash

# Fixes for 0.1.1 > 0.1.2x
theme="$(cat $HOME/Dots/Options/theme)"
style="$(cat $HOME/Dots/Options/style)"

if [[ ! -f "$HOME/.config/hypr/theme.conf" ]]; then
    cp -r $HOME/.config/hypr/themes/$style/theme.conf $HOME/.config/hypr/theme.conf
    hyprctl reload
    clear
fi

if [[ ! -f "$HOME/.config/swayosd/style.css" ]]; then
    cp -a "$HOME/.config/swayosd/$style/$theme.css" "$HOME/.config/swayosd/style.css"
    pkill swayosd
    setsid swayosd-server &> /dev/null &
    clear
fi

if [[ ! -f "$HOME/.config/eww/eww.scss" ]]; then
    cp -a "$HOME/.config/eww/$theme/eww.scss" "$HOME/.config/eww/"
    eww reload
    clear
fi