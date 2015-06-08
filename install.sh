#!/usr/bin/env bash

# backup old dotfiles
echo -e "\033[1;31m"
mkdir ~/.dotfiles_old
mv ~/.bashrc	  ~/.dotfiles_old/bashrc
[ "$(ls -A ~/.dotfiles_old)" ] && echo -e "\033[0;32mbackup to ~/.dotfiles_old\033[0m" || rm -r ~/.dotfiles_old

# install good dotfiles
ln -s ~/.dotfiles/bashrc      ~/.bashrc
echo -e "\033[0;32mgood dotfiles well installed!\033[0m"
