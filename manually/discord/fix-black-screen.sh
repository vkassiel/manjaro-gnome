#!/bin/bash

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