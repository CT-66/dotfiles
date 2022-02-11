#!/bin/bash
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

# ==============
mkdir -p ~/Pictures/Wallpapers
git clone https://github.com/CT-66/wallpapers ~/Pictures/Wallpapers

# ===============
sudo systemctl disable lightdm.service
sudo systemctl --user enable mpd.service

# ==============

for tty_num in {1..7}; do
    sudo mkdir -p "/etc/systemd/system/getty@tty$tty_num.service.d"
    sudo cp ~/Dotfiles/systemd/getty@tty.service.d/skip-username.conf "/etc/systemd/system/getty@tty$tty_num.service.d/skip-username.conf"
    sudo systemctl enable getty@tty$tty_num
done

# ==============

sudo mkdir /etc/systemd/system/getty@.service.d
sudo cp ~/Dotfiles/systemd/getty@.service.d/activate-numlock.conf /etc/systemd/system/getty@.service.d/activate-numlock.conf

# ==============
