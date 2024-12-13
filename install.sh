#!/bin/bash

clear
echo "Welcome to Geode's Dots Installer!"
echo ""
echo "These dotfiles are specific to Arch Linux ONLY! An update may come eventually for other distrobutions"
echo ""
read -p 'Press ENTER to START the installation: '

# NEED TO ADD DETECTION TO PUT THIS FOLDER IN DOWNLOADS/SEE IF ITS IN DOWNLOADS

# 
# FONT INSTALLATION #
# 

./Dots/Scripts/Installation/nerdfontinstall.sh
./Dots/Scripts/Installation/fontinstall.sh

# 
# AUR INSTALL #
# 

./Dots/Scripts/Installation/aurinstall.sh

# 
# GTK DARK THEME INSTALL #
# 

./Dots/Scripts/Installation/libadwaitafix.sh


