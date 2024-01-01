#!/bin/bash

# first update installed packages without confirmation (yes/no messages)
pamac update --no-confirm

# develop settings
sh ./develop/main.sh