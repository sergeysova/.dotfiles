#!/usr/bin/env bash

# backup old dotfiles
echo -e "\033[1;31m"
rm -rf ~/.dotfiles_old
mkdir ~/.dotfiles_old
mv ~/.bashrc	  ~/.dotfiles_old/bashrc
mv ~/.npmrc	  ~/.dotfiles_old/npmrc
mv ~/.gitconfig ~/.dotfiles_old/gitconfig
mv ~/.zshrc ~/.dotfiles_old/zshrc
mv ~/.psqlrc ~/.dotfiles_old/psqlrc
[ "$(ls -A ~/.dotfiles_old)" ] && echo -e "\033[0;32mbackup to ~/.dotfiles_old\033[0m" || rm -r ~/.dotfiles_old

# install good dotfiles
ln -s ~/.dotfiles/bashrc      ~/.bashrc
ln -s ~/.dotfiles/npmrc       ~/.npmrc
ln -s ~/.dotfiles/gitconfig   ~/.gitconfig
ln -s ~/.dotfiles/zshrc       ~/.zshrc
ln -s ~/.dotfiles/psqlrc      ~/.psqlrc

defaults import com.googlecode.iterm2 - < ./iterm2.plist
defaults import com.apple.dock - < ./dock.plist
defaults import com.apple.finder - < ./finder.plist
defaults import com.apple.driver.AppleBluetoothMultitouch.trackpad - < ./trackpad.plist

echo -e "\033[0;32mgood dotfiles well installed!\033[0m"

source ~/.bashrc
