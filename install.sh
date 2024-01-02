#!/bin/bash

contexts=(
  # develop settings
  develop
  # softwares
  softwares
  gnome-extensions
)

# first update installed packages without confirmation (yes/no messages)
pamac update --no-confirm

for folder in ${contexts[@]}; do
  cd ./$folder
  sh main.sh
  cd -
done

# change favorite apps on dock
favorite_apps="['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'firefox.desktop', 'obsidian.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'discord.desktop', 'com.slack.Slack.desktop', 'bitwarden.desktop', 'io.dbeaver.DBeaver.desktop', 'com.github.wwmm.easyeffects.desktop', 'filezilla.desktop', 'com.obsproject.Studio.desktop', 'gnome-system-monitor.desktop', 'rest.insomnia.Insomnia.desktop', 'postman.desktop', 'org.manjaro.pamac.manager.desktop', 'org.gnome.Extensions.desktop', 'com.mattjakeman.ExtensionManager.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Boxes.desktop']"
dconf write /org/gnome/shell/favorite-apps $favorite_apps

# fix discord upgrade message popup (SKIP_HOST_UPDATE)
# https://www.youtube.com/watch?v=3OEfr7L-gUk&t=302s
echo '{
  "IS_MAXIMIZED": false,
  "IS_MINIMIZED": false,
  "WINDOW_BOUNDS": {
    "x": 240,
    "y": 36,
    "width": 1440,
    "height": 1008
  },
  "SKIP_HOST_UPDATE": true
}' > ~/.config/discord/settings.json

# prevent discord black screen on sharing
sudo cp /etc/gdm/custom.conf /etc/gdm/custom.conf.backup
sudo echo '# GDM configuration storage

[daemon]
AutomaticLoginEnable=False
# Uncomment the line below to force the login screen to use Xorg
#WaylandEnable=false

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
#Enable=true' > /etc/gdm/custom.conf
