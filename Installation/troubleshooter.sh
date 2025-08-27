#!/bin/bash

echo "d888888P                            dP       dP                   dP                           dP   "
echo "   88                               88       88                   88                           88   "
echo "   88    88d888b. .d8888b. dP    dP 88d888b. 88 .d8888b. .d8888b. 88d888b. .d8888b. .d8888b. d8888P "
echo "   88    88'   88 88'   88 88    88 88'   88 88 88ooood8 Y8ooooo. 88'   88 88    88 88'   88   88   "
echo "   88    88       88.  .88 88.  .88 88.  .88 88 88.  ...       88 88    88 88.  .88 88.  .88   88   "
echo "   dP    dP        88888P   88888P  88Y8888' dP  88888P'  88888P' dP    dP  88888P   88888P'   dP   "
echo ""

conflict1() {
    echo "Please enter the name of the conflicting package/s below (the SECOND one listed when it failed)"
    echo ""
    echo "Example: swww-0.9.5-2 and swww-git-0.9.5.r183.g3e2e2ba-1 are in conflict"
    echo "In this example, you would type 'swww-git', as its conflicting"
    echo ""
    echo "Conflicts like this should have been resolved in the installation script, if you would like, please report the conflicting package in the form of a bug report."
    echo ""
    read -p " ■ " pkgrm
    sudo pacman -Rcns $pkgrm
    read -p "The command has been completed, press ENTER to return to the menu"
}

conflict2() {
    echo "Downloading package list to disk, please wait"
    curl -o $HOME/GeoDots/pkg-pacman -s https://geodearc.github.io/GeoDots/pkg-pacman
    curl -o $HOME/GeoDots/pkg-aurs -s https://geodearc.github.io/GeoDots/pkg-aurs
    curl -o $HOME/GeoDots/pkg-gtk -s https://geodearc.github.io/GeoDots/pkg-gtk
    curl -o $HOME/GeoDots/pkg-qt -s https://geodearc.github.io/GeoDots/pkg-qt
    clear
    echo "Look for similar matches to your conflicting/broken package"
    echo ""
    echo "You will look inside 4 package lists, once finished editing press CTRL+S then CTRL+X to save/exit."
    read -p "Press ENTER to begin"
    sudo pacman -S --needed nano
    nano $HOME/GeoDots/pkg-pacman
    nano $HOME/GeoDots/pkg-aurs
    nano $HOME/GeoDots/pkg-gtk
    nano $HOME/GeoDots/pkg-qt
    clear
    read -p "Finished, press ENTER to return to the menu"
}

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
    echo "├─ ▶  [4] Remove Chaotic-AUR (Issues relating to downloading packages after setup)"
    echo "├─ X  [5] Exit Troubleshooter"
    echo "│"
    echo "└─ Enter your choice [1-5]"
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
                while true; do
                echo "What would you like to do?"
                echo ""
                echo "1. Remove conflicting packages"
                echo "2. Modify package lists to remove conflicts"
                echo ""
                read -p " ■ " choice
                case "$choice" in
                    1)
                        conflict1
                        clear
                        break
                        ;;
                    2)
                        conflict2
                        clear
                        break
                        ;;
                    *)
                        clear
                        echo "X Invalid choice. Please try again."
                        echo ""
                        ;;
                esac
            done
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