#!/bin/bash

softwares_to_install=(
  discord
  # easyeffects [pipewire software to noise cancellation]
  easyeffects
  filezilla
  obsidian
  bitwarden
  gnome-tweaks
  # its nice to test another linux distros
  gnome-boxes
  # font manager (uninstall/view/install)
  font-manager
  obs-studio
)

for software in ${softwares_to_install[@]}; do
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