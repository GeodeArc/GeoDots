#!/bin/bash

swaync-client -t
cliphist list | rofi -dmenu | cliphist decode | wl-copy
