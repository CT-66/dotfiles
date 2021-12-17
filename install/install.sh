#!/bin/sh
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/Dotfiles

source $DOTFILES_DIR/install/install-apps.sh
source $DOTFILES_DIR/install/create-symlinks.sh
source $DOTFILES_DIR/install/nvim-plugins.sh
source $DOTFILES_DIR/install/vscode-extensions.sh
source $DOTFILES_DIR/install/zsh-plugins.sh

# =============
chsh -s /usr/bin/zsh
echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment
