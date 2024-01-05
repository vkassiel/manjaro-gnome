#!/bin/bash

# download icons from official repo
git clone --depth=1 https://github.com/yeyushengfan258/Reversal-icon-theme reversal-icon-theme
cd reversal-icon-theme
echo $SUDO_PASSWORD | sudo sh install.sh -d "/usr/share/icons" -n "-black"
cd ..
rm -rf reversal-icon-theme

# set icon theme
dconf write /org/gnome/desktop/interface/icon-theme "'Reversal-black-dark'"