#!/bin/bash

version="$(curl -s https://geodearc.com/GeoDots/data/version)"
aurhelper="$(cat $HOME/Dots/Options/aurhelper)"

theme="$(cat $HOME/Dots/Options/theme)"
style="$(cat $HOME/Dots/Options/style)"

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

if [[ ! -s "$HOME/Dots/Options/currentver" ]]; then
    echo "$version" > "$HOME/Dots/Options/currentver"
fi

if ! pacman -Q hyprshutdown &>/dev/null; then
    $aurhelper hyprshutdown
fi