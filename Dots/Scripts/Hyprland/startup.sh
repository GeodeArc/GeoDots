#!/bin/bash

if [ -f "$HOME/Dots/Options/startup" ] && grep -q "postinstall" "$HOME/Dots/Options/startup"; then
    kitty $HOME/Dots/Scripts/postinstall.sh
elif [ -f "$HOME/Dots/Options/startup" ] && grep -q "postupgrade" "$HOME/Dots/Options/startup"; then
    kitty $HOME/Dots/Scripts/postupgrade.sh
elif [ -f "$HOME/Dots/Options/autologin" ] && grep -q "enabled" "$HOME/Dots/Options/autologin"; then
    hyprlock
elif [ -f "$HOME/Dots/Options/clock" ] && grep -q "enabled" "$HOME/Dots/Options/clock"; then
    eww open clock 
fi
