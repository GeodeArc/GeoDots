#!/bin/bash

clear
echo "" > $HOME/GeoDots/geodots_aurhelper

#
# DOTFILES OPTIONS + BASE INSTALL 
#

./Installation/install-options.sh

# 
# PACKAGE INSTALL
# 

./Installation/install-packages.sh
