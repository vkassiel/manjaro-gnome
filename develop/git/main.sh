#!/bin/bash

# install git without confirmation screen (yes/no)
pamac install git --no-confirm

# save credentials data indefinitely
git config --global credential.helper store

# variables
GIT_PERSONAL_NAME="YOUR_GIT_PERSONAL_NAME"
GIT_PERSONAL_EMAIL="YOUR_GIT_PERSONAL_EMAIL"
GIT_PERSONAL_PROJECTS_WORK_DIR="YOUR_GIT_PERSONAL_PROJECTS_DIRECTORY_NAME"
GIT_DEFAULT_HUB="YOUR_GIT_DEFAULT_HUB" # i.e.: github, gitlab etc.

# custom git name/email by folder
mkdir ~/$GIT_PERSONAL_PROJECTS_WORK_DIR

echo '[user]
    name = "'${GIT_PERSONAL_NAME}'"
    email = '"${GIT_PERSONAL_EMAIL}"'' > ~/.gitconfig-${GIT_DEFAULT_HUB}
echo 'OK'

echo '[user]
        name = '"$GIT_PERSONAL_NAME"'
        email = '"$GIT_PERSONAL_EMAIL"'

[includeIf "gitdir:~/'$GIT_PERSONAL_PROJECTS_WORK_DIR'/"]
        path = .gitconfig-'$GIT_DEFAULT_HUB'

[credential]
        helper = store
[alias]
        c = checkout
        # before uncomment, change this line to single quote
        # l = !git log --pretty="format:%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr"
        p = push
[core]
        editor = code --wait
[filter "lfs"]
        smudge = git-lfs smudge -- %f
        process = git-lfs filter-process
        required = true
        clean = git-lfs clean -- %f
[init]
        defaultBranch = main' > ~/.gitconfig
