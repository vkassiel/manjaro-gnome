#!/bin/bash

gnome_extensions=(
  Vitals@CoreCoding.com # enabled
  pano@elhan.io # enabled
  rounded-window-corners@yilozt
  tiling-assistant@leleat-on-github
  no-overview@fthx # enabled
  search-light@icedman.github.com # enabled
  AddCustomTextToWorkSpaceIndicators@pratap.fastmail.fm
  appmenu-is-back@fthx # enabled
  just-perfection-desktop@just-perfection
  activate-window-by-title@lucaswerkmeister.de # enabled
  blur-my-shell@aunetx
  color-picker@tuberry
  disable-workspace-switcher-overlay@cleardevice
  disable-workspace-switcher@jbradaric.me
  eepresetselector@ulville.github.io
)

# TODO: make this possible
# is possible with pamac installation with prefix `gnome-shell-extension-<EXTENSON-NAME>`
# https://askubuntu.com/questions/1073471/installation-of-gnome-shell-extensions-does-not-ask-for-root-password
# for extension in ${gnome_extensions[@]}; do
#   echo "Trying to install gnome-extension '"$extension"'"
#   gnome-extensions install $extension
# done