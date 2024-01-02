#!/bin/bash

# install yay package manager -- like pacman, but faster (use golang)
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USER:$USER ./yay-git
cd yay-git
makepkg -si --noconfirm

# update packages
yay -Syu --devel --timeupdate

softwares=(
  extension-manager
  lazydocker
)

for software in ${softwares[@]}; do
  echo "Trying to install '"$software"' with yay"
  yay -S -y --needed --noconfirm $software
done

# clean up all unwanted dependencies
yay -Yc -y --noconfirm