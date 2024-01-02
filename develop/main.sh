#!/bin/bash

# base-devel packages
# 'base-devel' packages are used by AUR packages build processes
pamac install base-devel --no-confirm

# git
sh ./git/main.sh

# install docker engine
pamac install docker --no-confirm

# install vscode and set settings and extensions
sh ./vscode/main.sh

# install dbeaver
pamac install dbeaver --no-confirm

# install filezilla
pamac install filezilla --no-confirm