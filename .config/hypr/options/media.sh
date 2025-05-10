#!/bin/bash

# band aid fix since hyprland sux (sorry vaxry)

currentsong=$(playerctl metadata --player spotify --format ' {{title}} - {{artist}}')
echo $currentsong > $HOME/.config/hypr/options/currentsong
