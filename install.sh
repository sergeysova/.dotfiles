#!/usr/bin/env bash

# install sublime
source ./sublime.sh


# backup old dotfiles
echo -e "\033[1;31m"
rm -rf ~/.dotfiles_old
mkdir ~/.dotfiles_old
mv ~/.bashrc	  ~/.dotfiles_old/bashrc
mv ~/.npmrc	  ~/.dotfiles_old/npmrc
mv ~/.gitconfig ~/.dotfiles_old/gitconfig
[ "$(ls -A ~/.dotfiles_old)" ] && echo -e "\033[0;32mbackup to ~/.dotfiles_old\033[0m" || rm -r ~/.dotfiles_old

# install good dotfiles
ln -s ~/.dotfiles/bashrc      ~/.bashrc
ln -s ~/.dotfiles/npmrc       ~/.npmrc
ln -s ~/.dotfiles/gitconfig   ~/.gitconfig
echo -e "\033[0;32mgood dotfiles well installed!\033[0m"

source ~/.bashrc
