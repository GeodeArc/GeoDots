#!/bin/bash

if [ -f "$HOME/Dots/Options/startup" ] && grep -q "postinstall" "$HOME/Dots/Options/startup"; then
    kitty $HOME/Dots/Scripts/postinstall.sh
elif [ -f "$HOME/Dots/Options/autologin" ] && grep -q "enabled" "$HOME/Dots/Options/autologin"; then
    hyprlock
fi
