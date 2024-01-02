#!/bin/bash

contexts=(
  # develop settings
  develop
  # softwares
  softwares
)

# update mirrors and packages with pacman
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# first update installed packages without confirmation (yes/no messages)
pamac update --no-confirm

for folder in ${contexts[@]}; do
  cd ./$folder
  sh main.sh
  cd -
done

# change favorite apps on dock
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'firefox.desktop', 'obsidian.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'discord.desktop', 'com.slack.Slack.desktop', 'bitwarden.desktop', 'io.dbeaver.DBeaver.desktop', 'com.github.wwmm.easyeffects.desktop', 'filezilla.desktop', 'com.obsproject.Studio.desktop', 'gnome-system-monitor.desktop', 'rest.insomnia.Insomnia.desktop', 'postman.desktop', 'org.manjaro.pamac.manager.desktop', 'org.gnome.Extensions.desktop', 'com.mattjakeman.ExtensionManager.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Boxes.desktop']"
