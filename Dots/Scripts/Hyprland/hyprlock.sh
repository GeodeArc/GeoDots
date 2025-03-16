#!/bin/bash

# Paths to the templates and the target configuration file
TEMPLATE_DIR="$HOME/Dots/Config/hyprlock/"
CONFIG_FILE="$HOME/Dots/Config/hyprlock.conf"

read -p "This utility is unfinished, sorry for the inconvenience. Press ENTER to exit."
exit 0

echo "Welcome to the Hyprlock Settings!"
echo "Press CTRL+C at any time to quit"
echo ""

PS3='Enter an option: '
options=("Change Background" "Edit Primary Display" "Change Resolution Preset" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Change Background")
			clear
			break
            ;;
        "Edit Primary Display")
			clear
			break
            ;;
        "Change Size Preset")
			clear
			break
            ;;
        "Quit")
		    clear
            break
            ;;
        *) echo "Invalid option '$REPLY'";;
    esac
done

# Display resolution options
echo "Please choose a resolution that fits your MAIN display (1-5):"
echo "1. 720p - 768p"
echo "2. 1080p - 1200p"
echo "3. 1440p"
echo "4. 2160p"
echo "5. None of these"

# Read user input
read -p "Enter the number corresponding to your choice: " choice

# Function to update the config file
update_config() {
    local resolution=$1
    local template_file="$TEMPLATE_DIR/$resolution.conf"
    if [[ -f "$template_file" ]]; then
    	echo ""
        echo " Updating $CONFIG_FILE for resolution $resolution"
        cat "$template_file" > "$CONFIG_FILE"
        echo " Configuration updated successfully."
        echo ""
        echo "Exiting shortly.."
        sleep 1
    else
    	echo ""
        echo "  Could find this template, please make sure you typed a number from 1-5!"
        echo ""
	read -p "Hit enter to exit"
    fi
}

case $choice in
    1)
        update_config "720"
        ;;
    2)
        update_config "1080"
        ;;
    3)
        update_config "1440"
        ;;
    4)
        update_config "2160"
        ;;
    5)
		echo ""
		echo "Unfortunately, I havent made a config for your monitor resolution, sorry!"
		echo "Please edit hyprlock config accordingly (~/.config/hypr/hyprlock.conf, or ~/Dots/Config/hypr/hyprlock.conf), or try some presets."
		echo ""
		read -p "Hit enter to exit"
		;;
    *)
        echo ""
        echo "  Could find this template, please make sure you typed a number from 1-3!"
        echo ""
		read -p "Hit enter to exit"
        ;;
esac
