#!/bin/bash

clear
echo " ✓ Selected Guided Install"

# 
# FONT INSTALLATION #
# 

./Dots/Scripts/Installation/install-nerdfonts.sh
./Dots/Scripts/Installation/install-font.sh

# 
# AUR INSTALL #
# 

./Dots/Scripts/Installation/install-aur.sh

# 
# GTK DARK THEME INSTALL #
# 

./Dots/Scripts/Installation/fix-libadwaita.sh