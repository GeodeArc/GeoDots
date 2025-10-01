#!/bin/bash

MONITORS=( $(hyprctl monitors | grep -oP '(?<=Monitor )[^ ]+') )
CONFIG="$HOME/.config/hypr/config/hardware/monitor.conf"

clear

monitoradd() {
    while true; do
        clear
        while true; do
            echo "Below are your current monitor IDs. Please enter the number of the monitor you would like to add."
            echo ""
            for i in "${!MONITORS[@]}"; do
                echo "$((i+1)) - ${MONITORS[i]}"
            done
            echo ""
            echo -n " ■ " 
            read -r choice

            if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#MONITORS[@]} ]; then 
                break
            fi
            clear
            echo "X Please try again."
            echo ""
        done

        mon=${MONITORS[$((choice-1))]}

        res=$(hyprctl monitors \
        | grep -A100 "^Monitor $mon " \
        | grep -m1 "availableModes:" \
        | sed -E 's/^[[:space:]]*availableModes:[[:space:]]*//; s/Hz//g; s/@([0-9]+)\.[0-9]+/@\1/g'
        )

        clear
        while true; do
            echo "Please enter the resolution of your monitor."
            echo "You can enter 'skip' to automatically select the preferred resolution."
            echo "Examples: 1920x1080 - 3840x2160@60 - 2560x1440@144 etc."
            echo
            echo "Below are the available resolutions the selected monitor."
            echo "$res"
            echo 
            echo "Tip: You can copy paste a resolution from the list above with CTRL+SHIFT+C / CTRL+SHIFT+V"
            echo 
            echo -n " ■ "
            read -r resolution

            if [[ "$resolution" == "skip" ]]; then
                resolution='preferred'
                break
            fi

            if [[ "$resolution" =~ ^[0-9]+x[0-9]+@[0-9]+$ ]] || [[ "$resolution" =~ ^[0-9]+x[0-9]+$ ]]; then
                break
            fi

            clear
            echo "X Please try again."
            echo ""
        done

        clear
        while true; do
            echo "Where should the monitor be placed?"
            echo "If this is the first monitor, you should probably select 1."
            echo 
            echo "1: Automatically (0x0 if the first monitor)"
            echo "2: Auto Left"
            echo "3: Auto Right"
            echo "4: Auto Above"
            echo "5: Auto Below"
            echo "6: Custom"
            echo ""
            read -p " ■ " choice

            case $choice in 
                1)
                    pos="auto"
                    break
                    ;;
                2)
                    pos="auto-left"
                    break
                    ;;
                3)
                    pos="auto-right"
                    break
                    ;;
                4)
                    pos="auto-up"
                    break
                    ;;
                5)
                    pos="auto-down"
                    break
                    ;;
                6)
                    echo 
                    echo "Enter the x and y coordinates of the monitor."
                    echo "Example: 100x100"
                    read -p " ■ " pos

                    if [[ "$pos" =~ ^[0-9]+x[0-9]+$ ]]; then
                        break
                    fi

                    clear
                    echo "X Please try again."
                    echo ""
                    ;;
                *)
                    clear
                    echo "X Please try again."
                    echo ""
                    ;;
            esac
        done

        clear
        while true; do
            echo "What scale factor should the monitor have?"
            echo "Appropriate scale factors depend on the resolution of the monitor."
            echo "If you are unsure, leave it at 1."
            echo
            echo "Common scale factors include: 1, 1.25, 1.5, 1.75, 2. etc."
            echo ""
            read -p " ■ " scale

            if [[ "$scale" =~ ^[0-9]+\.[0-9]+$ ]] || [[ "$scale" =~ ^[0-9]+$ ]]; then
                break
            fi

            clear 
            echo "X Please try again."
            echo ""
        done

        clear
        while true; do
            echo "Finally, would you like to rotate the monitor?"
            echo 
            echo "0 - Skip"
            echo "1 - 90 degrees"
            echo "2 - 180 degrees"
            echo "3 - 270 degrees"
            echo 
            read -p " ■ " choice

            if [[ "$choice" == "0" ]]; then
                tenabled="False"
                break
            fi

            if [[ "$choice" =~ ^[0-3]$ ]]; then
                transform="transform,$choice"
                tenabled="True, $choice"
                break
            fi

            clear
            echo "X Please try again."
            echo ""
        done
        
        clear
        echo "Finished configuring monitor."
        echo "Please edit the config file directly if you want more advanced options (VRR, HDR, mirroring, etc)."
        echo 
        echo "Below is your current configuration."
        echo -e "ID: $mon\nResolution: $resolution\nPosition: $pos\nScale: $scale\nTransform: $tenabled"
        echo
        echo "Add monitor to config file? [Y/N]"
        read -p " ■ " choice

        case $choice in
            [Yy])
                echo -e "monitor=$mon,$resolution,$pos,$scale,$transform" >> $CONFIG
                clear
                echo "Finished, press ENTER to return."
                read -p " ■ "
                break
                ;;
            [Nn])
                clear
                echo "Abandoned, press ENTER to return."
                read -p " ■ "
                break
                ;;
            *)
                clear
                echo "X Please try again."
                echo ""
                ;;
        esac
    done
}

monitorremove() {
    mapfile -t monitors < <(grep '^monitor=' "$CONFIG")

    echo "Below are the monitors currently configured."
    echo "Please enter the number of the monitor you would like to remove."
    echo ""
    echo "Alternatively, type '0' to return"

    for i in "${!monitors[@]}"; do
        echo "$((i+1)) - ${monitors[i]}"
    done

    echo ""
    echo -n " ■ " 
    read -r choice

    if [[ "$choice" == "0" ]]; then
        clear
        return
    fi

    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#monitors[@]} ]; then
        sed -i "/^${monitors[$((choice-1))]}$/d" "$CONFIG"
        clear
        echo "Finished, press ENTER to return."
        read -p " ■ "
    else
        clear
        echo "X Please try again."
        echo ""
    fi
}

while true; do
    echo "-- MONITOR CUSTOMIZATION --"
    echo 
    echo "Current configuration:"
    cat $CONFIG
    echo 
    echo "-------------------------------------------------------"
    echo "1. Configure a monitor                               󰍹" 
    echo "2. Remove a monitor's configuration                  󰶐"
    echo "3. Edit config file directly (Advanced)              󰌌"
    echo "-------------------------------------------------------"
    echo "4. Return                                             󰌑"
    echo "-------------------------------------------------------"
    echo ""
    read -p " ■ " choice

    case $choice in 
        1)
            clear
            monitoradd
            clear
            ;;
        2)
            clear
            monitorremove
            clear
            ;;
        3)
            clear
            nano $HOME/.config/hypr/config/hardware/monitor.conf
            clear
            ;;
        4)
            clear
            $HOME/Dots/Scripts/Settings/settings.sh
            ;;
        *)
            clear
            echo "X Please try again."
            echo ""
            ;;
    esac
done