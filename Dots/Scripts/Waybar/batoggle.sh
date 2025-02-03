#!/bin/bash

if pgrep -x "blueman-applet" > /dev/null
then
    pkill -x blueman-applet
else
    blueman-applet &
fi
