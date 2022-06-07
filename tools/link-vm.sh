#!/bin/bash

if (($EUID == 0)); then
  echo >&2 "Can't run this as root!"
  exit 1
fi

mv ~/.zshrc ~/.zshrc.old

# rest is plain link.sh

# make sure we dump those configs where they should be
mkdir ~/.config
mkdir ~/.ssh
mkdir ~/.gnupg

# symlink configs from .dotfiles
ln -s ~/.dotfiles/config/i3 ~/.config/i3
ln -s ~/.dotfiles/config/terminator ~/.config/terminator
ln -s ~/.dotfiles/config/redshift ~/.config/redshift

ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

chmod -R 700 ~/.gnupg/ ~/.ssh/

# If we want copy/paste in a vm, we need this:

echo "exec /usr/bin/vmware-user-suid-wrapper" >> ~/.config/i3/config


