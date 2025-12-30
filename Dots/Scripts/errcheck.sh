#!/bin/bash

errver=$(curl -s https://gdrc.me/GeoDots/data/errorver)
errmsg=$(curl -s https://gdrc.me/GeoDots/data/errormsg)
curver=$(cat $HOME/Dots/Options/currentver)
terminal=$(cat $HOME/Dots/Options/terminal)

[[ -z "$errver" || -z "$errmsg" || -z "$curver" ]] && exit 0

if [[ "$errver" == "$curver" ]]; then
    ACTION=$(notify-send \
		--icon dialog-warning-symbolic \
        --action=open="View details" \
        "Please Upgrade GeoDots" \
        "A recent application update has likely introduced issues with new breaking changes. \n\nClick below to learn more")

    if [[ "$ACTION" == "open" ]]; then
        $terminal bash -c "
            echo 'Hyprland and other applications GeoDots uses update often.'
            echo 'Sometimes, breaking changes are introduced that create issues.'
            echo 'Below is a message describing what has happened.'
            echo
            echo \"$errmsg\"
            echo
            echo 'A fix has been issued in a new update. Please update by:'
            echo '- Opening the Settings app (SUPER + I)'
            echo '- Selecting Upgrade GeoDots'
            echo
            echo 'Press ENTER to close this message'
            read
        "
    fi
fi
