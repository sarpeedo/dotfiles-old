#!/bin/bash

# let us see whats going on (@echo off in dos)
set -x

# download necessary packages
sudo pacman -S gvim
sudo pacman -S git

# configure git
echo "git name: "
read -e name
echo "git email: "
read -e email

git config --global user.name "$name"
git config --global user.email $email

# download and install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download and configure dotfiles
mkdir ~/dotfiles
cd ~/dotfiles

# installs plugins from vimrc
vim +PlugInstall +qall


