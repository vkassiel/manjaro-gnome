#!/bin/bash

# IMPORTANT: just run this after starting discord app at least once
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