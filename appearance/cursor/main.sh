#!/bin/bash

curl -L https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur.tar.gz > macOS-BigSur.tar.gz
tar -xvf macOS-BigSur.tar.gz
sudo mv macOS-BigSur /usr/share/icons/

# set cursor theme
dconf write /org/gnome/desktop/interface/cursor-theme "'macOS-BigSur'"