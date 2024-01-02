#!/bin/bash

# Softwares to install with PAMAC package manager
pamac_softwares=(
  discord
  # easyeffects [pipewire software to noise cancellation]
  easyeffects
  obsidian
  bitwarden
  gnome-tweaks
  # its nice to test another linux distros
  gnome-boxes
  # font manager (uninstall/view/install)
  font-manager
  obs-studio
)

for software in ${pamac_softwares[@]}; do
  echo "Trying to install '"$software"'"
  pamac install $software --no-confirm
done

softwares_to_build=(
  google-chrome
  slack-desktop
)

for software in ${softwares_to_build[@]}; do
  echo "Trying to build '"$software"'"
  pamac build $software --no-confirm
done

# Softwares to install with YAY package manager
# install yay package manager -- like pacman, but faster (use golang)
yay_default_directory="/opt/yay-git"
if [ ! -d "$yay_default_directory" ]; then
  cd /opt
  sudo git clone https://aur.archlinux.org/yay-git.git
  sudo chown -R $USER:$USER ./yay-git
  cd yay-git
  makepkg -si --noconfirm
fi

# update packages
yay -Syu --devel --timeupdate

softwares=(
  extension-manager
  lazydocker
)

for software in ${softwares[@]}; do
  if [ ! -d "/usr/bin/$software" ]; then
    echo "Trying to install '"$software"' with yay"
    yay -S -y --needed --noconfirm $software
  fi
done

# clean up all unwanted dependencies
yay -Yc -y --noconfirm