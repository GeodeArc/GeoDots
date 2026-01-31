#!/bin/bash

battery=$(upower -e | grep battery | head -n1)

# dont print anything if theres no battery
[ -z "$battery" ] && exit 0

info=$(upower -i "$battery")
percent=$(awk '/percentage/ {gsub(/%/, "", $2); print $2}' <<< "$info")
state=$(awk '/state/ {print $2}' <<< "$info")

if   [ "$percent" -lt 5  ]; then icon="󰂃"
elif [ "$percent" -lt 10 ]; then icon="󰁺"
elif [ "$percent" -lt 20 ]; then icon="󰁻"
elif [ "$percent" -lt 30 ]; then icon="󰁼"
elif [ "$percent" -lt 40 ]; then icon="󰁽"
elif [ "$percent" -lt 50 ]; then icon="󰁾"
elif [ "$percent" -lt 60 ]; then icon="󰁿"
elif [ "$percent" -lt 70 ]; then icon="󰂀"
elif [ "$percent" -lt 80 ]; then icon="󰂁"
elif [ "$percent" -lt 90 ]; then icon="󰂂"
else                             icon="󰁹"
fi

if [ "$state" = "charging" ]; then
    icon="󱐋 $icon"
fi

echo "$icon $percent%"
