#!/bin/bash

echo "d888888P                            dP       dP                   dP                           dP   "
echo "   88                               88       88                   88                           88   "
echo "   88    88d888b. .d8888b. dP    dP 88d888b. 88 .d8888b. .d8888b. 88d888b. .d8888b. .d8888b. d8888P "
echo "   88    88'   88 88'   88 88    88 88'   88 88 88ooood8 Y8ooooo. 88'   88 88    88 88'   88   88   "
echo "   88    88       88.  .88 88.  .88 88.  .88 88 88.  ...       88 88    88 88.  .88 88.  .88   88   "
echo "   dP    dP        88888P   88888P  88Y8888' dP  88888P'  88888P' dP    dP  88888P   88888P'   dP   "
echo ""

customcmd() {
    echo "Couldnt find an AUR helper, are you using a custom AUR helper? [Y/N/?]"
    read -p " ■ " customaur
    
    case "$aurhelper" in
        [Yy])
            echo "Please enter the command for clearing AUR/Pacman Cache below:"
            echo "Refer to your AUR helpers documentation"
            read -p " ■ " aurcachecmd
            $aurcachecmd
            read -p "The command has been completed, please press ENTER to return to the menu"
            clear
            ;;
        [Nn])
            echo "The troubleshooter will still refresh pacman cache."
            echo "Type 'y' at each section, and press enter."
            sudo pacman -Scc
            read -p "The command has been completed, please press ENTER to return to the menu"
            clear
            ;;
        ?)
            echo "You probably arent, the troubleshooter will still refresh pacman cache."
            echo "Type 'y' at each section, and press enter."
            sudo pacman -Scc
            read -p "The command has been completed, please press ENTER to return to the menu"
            clear
            ;;
        *)
            clear
            echo "X Invalid choice. Please try again."
            echo ""
            ;;
    esac    
}

while true; do
    echo "┌─ Welcome to the PACMAN troubleshooter."
    echo "├─ Please select an issue below:"
    echo "│"
    echo "├─ ▶  [1] Clear Pacman/AUR Cache (General Fixes)"
    echo "├─ ▶  [2] Check network with nmtui (Error 404s etc) (Only for NetworkManager users)"
    echo "├─ ▶  [3] Conflicting Packages ('Conflicts Found', 'Couldnt satisfy depends' etc)"
    echo "├─ ▶  [4] Remove Chaotic-AUR ('Conflicts Found', 'Couldnt satisfy depends' etc)"
    echo "├─ X  [5] Exit Troubleshooter"
    echo "│"
    echo "└─ Enter your choice [1-4]"
    read -p " ■ " pacman

    case "$pacman" in
        1)
            clear
            if command -v yay &> /dev/null; then
                echo "Type 'y' at each section, and press enter."
                yay -Scc
                read -p "The command has been completed, please press ENTER to return to the menu"
                clear
            elif command -v paru &> /dev/null; then
                echo "Type 'y' at each section, and press enter."
                paru -Scc
                read -p "The command has been completed, please press ENTER to return to the menu"
                clear
            else
                $customcmd
            fi
            ;;
        2)
            nmtui
            clear
            ;;  
        3)  
            clear
            echo "Please enter the name of the conflicting package/s below (the SECOND one listed when it failed)"
            echo "If more conflicting packages show up, enter Y (to remove) for all and see if it works"
            echo ""
            echo "Example: swww-0.9.5-2 and swww-git-0.9.5.r183.g3e2e2ba-1 are in conflict"
            echo "In this example, you would type 'swww-git'"
            echo ""
            echo "Be very careful here, if you see important things being listed for removal (e.g xorg), you may run into trouble"
            echo "If you remove your desktop environment, make sure to finish installation before logging out so you still have a working system"
            read -p " ■ " pkgrm
            sudo pacman -Rcns $pkgrm
            read -p "The command has been completed, please press ENTER to return to the menu"
            clear
            ;;    
        4) 
            sudo sed -i '/^\[chaotic-aur\]$/d; /^\s*Include\s*=\s*\/etc\/pacman.d\/chaotic-mirrorlist$/d' /etc/pacman.conf
            read -p "Should be done, press ENTER to return to the main menu"
            clear
            ;;
        5)  
            clear
            echo "Bye bye!"
            exit 0
            ;;
        *)
            clear
            echo "X Invalid choice. Please try again."
            echo ""
            ;;
    esac
done
