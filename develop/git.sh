#!/bin/bash

# install git without confirmation screen (yes/no)
echo 'Installing git...'
pamac install git --no-confirm
echo 'OK'

# save credentials data indefinitely
git config --global credential.helper store

# variables
export GIT_PERSONAL_NAME="Vitor Almeida"
export GIT_PERSONAL_EMAIL="kassielalmeida@gmail.com"
export GIT_PERSONAL_PROJECTS_WORK_DIR="dev"
export GIT_DEFAULT_HUB="github"

export YOUR_COMPANY_NAME="planium"
export GIT_PROFESSIONAL_NAME="Vitor Almeida"
export GIT_PROFESSIONAL_EMAIL="vitor.almeida@planium.io"
export GIT_PROFESSIONAL_PROJECTS_WORK_DIR="${YOUR_COMPANY_NAME}"

mkdir ~/$GIT_PERSONAL_PROJECTS_WORK_DIR
mkdir ~/$GIT_PROFESSIONAL_PROJECTS_WORK_DIR

echo 'Creating your personal git config file...'
echo '[user]
    name = "'${GIT_PERSONAL_NAME}'"
    email = '"${GIT_PERSONAL_EMAIL}"'' > ~/.gitconfig-${GIT_DEFAULT_HUB}
echo 'OK'

echo 'Creating your professional git config file...'
echo '[user]
    email = '"${GIT_PERSONAL_EMAIL}"'' > ~/.gitconfig-${YOUR_COMPANY_NAME}
echo 'OK'

echo 'Creating your custom git config file...'
echo '[user]
        name = Vitor Almeida
        email = vitor.almeida@planium.io

[includeIf "gitdir:~/'$GIT_PERSONAL_PROJECTS_WORK_DIR'/"]
        path = .gitconfig-'$GIT_DEFAULT_HUB'
[includeIf "gitdir:~/'$GIT_PROFESSIONAL_PROJECTS_WORK_DIR'/"]
        path = .gitconfig-'$YOUR_COMPANY_NAME'
[includeIf "gitdir:~/var/www/html/scarlett/"]
        path = .gitconfig-'$YOUR_COMPANY_NAME'

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
echo 'OK'