#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    pkill -x waybar
    sleep 0.5
    waybar &
else
    waybar &
fi
