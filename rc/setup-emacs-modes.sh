#!/bin/bash 

cd ~/home/rc/emacs.d

clone_or_update() {
  local repo=$1
  local basename=$(basename $repo | sed -e 's/[.]git$'//)
  if [ -d $basename ]; then
    (cd $basename && git pull --rebase)
  else
    git clone $repo
  fi
}

clone_or_update git@github.com:mlf176f2/auto-indent-mode.el.git
clone_or_update git@github.com:dvryaboy/piglatin-mode.git

wget -q -O - 'https://marmalade-repo.org/packages/python-mode-6.1.3.tar' | tar xf -
