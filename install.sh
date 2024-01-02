#!/bin/bash

contexts=(
  # develop settings
  develop
  # softwares
  softwares
)

# first update installed packages without confirmation (yes/no messages)
pamac update --no-confirm

for folder in ${contexts[@]}; do
  cd ./$folder
  sh main.sh
  cd -
done
