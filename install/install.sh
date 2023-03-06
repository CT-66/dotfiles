#!/bin/bash
set -e

if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root"
   exit 1
fi

read -p "Enter your username: " user_name
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

cd $HOME/Dotfiles/paleofetch
make install

cd $HOME/Dotfiles/paleofetch2
make install

mkdir ~/.cache/zsh
touch ~/.cache/zsh/history

# ==============
mkdir -p ~/Pictures/Wallpapers
git clone --depth 1 https://github.com/CT-66/wallpapers ~/Pictures/Wallpapers

# ===============
systemctl --user enable mpd.service
systemctl enable --user mpDris2.service
sudo systemctl enable reflector.service
sudo systemctl enable archlinux-keyring-wkd-sync.timer

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
sudo mkdir -p /usr/local/share/kbd/keymaps
sudo cp ~/Dotfiles/keymaps/us-custom.map.gz /usr/local/share/kbd/keymaps
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp ~/Dotfiles/keymaps/vconsole.conf /etc/vconsole.conf

# ==============
if [ -f "/etc/sudoers" ]; then
  sudo mv /etc/sudoers /etc/sudoers.bak
fi

sudo cp ~/Dotfiles/sudo/sudoers /etc/sudoers
sudo chown -c root:root /etc/sudoers
sudo chmod -c 0440 /etc/sudoers

# ==============
# disable locking out user after 3 failed attempts
sudo cp /etc/security/faillock.conf /etc/security/faillock.conf.bak
sudo sed -i '32s/.*/deny = 0/' /etc/security/faillock.conf
