#!/bin/bash

echo "This script will allow you to reinstall things like nerd fonts/AUR helpers if they didnt install properly the first time"
read -p "Press enter to delete cache files, or ctrl+c to stop this script: "

rm -r /tmp/dotaurinstall
rm -r /tmp/dotfontinstall
