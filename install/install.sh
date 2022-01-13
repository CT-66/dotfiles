#!/bin/sh
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Enter your username"
read user_name
HOME=/home/$user_name

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/Dotfiles

source $DOTFILES_DIR/install/install-apps.sh
source $DOTFILES_DIR/install/create-symlinks.sh
source $DOTFILES_DIR/install/nvim-plugins.sh
source $DOTFILES_DIR/install/vscode-extensions.sh

# =============
chsh -s /usr/bin/zsh

cd $HOME/Dotfiles/st
sudo make clean install

mkdir ~/.cache/zsh
touch ~/.cache/zsh/history
