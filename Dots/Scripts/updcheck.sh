#!/bin/bash

newver=$(curl -s https://gdrc.me/GeoDots/data/version)
curver=$(cat $HOME/Dots/Options/currentver)
terminal=$(cat $HOME/Dots/Options/terminal)
updcheck=$(cat $HOME/Dots/Options/updcheck)

if [[ "$updcheck" == "true" ]]; then
    if [[ "$newver" != "$curver" ]]; then
        ACTION=$(notify-send \
            --icon software-update-available-symbolic \
            --action=open="View details" \
            "A GeoDots update is available" \
            "A new version of GeoDots has released with new features. \n\nClick below to learn more")

        if [[ "$ACTION" == "open" ]]; then
            $terminal bash -c "
                echo 'Hyprland and other applications GeoDots uses update often.'
                echo 'Sometimes, breaking changes are introduced that create issues.'
                echo 'Below is your current version and the new version.'
                echo
                echo \"Current Version: $curver\"
                echo \"New Version: $newver\"
                echo
                echo 'Please update by:'
                echo '- Opening the Settings app (SUPER + I)'
                echo '- Selecting Upgrade GeoDots'
                echo
                echo 'Want to disable this notification? You can disable it in the settings app.'
                echo '4 - Customize Dotfiles > 0 - Disable Update Notification'
                echo 
                echo 'Press ENTER to close this message'
                read
            "
        fi
    fi
fi
