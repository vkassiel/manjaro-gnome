#!/bin/bash

# base-devel packages
# 'base-devel' packages are used by AUR packages build processes
pamac install base-devel --no-confirm

# git
sh git.sh

# install docker engine
pamac install docker --no-confirm

# install vscode
git clone https://aur.archlinux.org/visual-studio-code-bin.git vscode
cd ./vscode
makepkg -si
cd ..
rm -rf ./vscode

# install dbeaver
pamac install dbeaver --no-confirm

# install filezilla
pamac install filezilla --no-confirm