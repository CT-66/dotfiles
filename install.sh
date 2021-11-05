#!/bin/sh
set -e

# not completed yet
# do not use!!

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi


CONFIG_DIR=$HOME/.config

if [ -d "$HOME/.config" ]; then
    echo "[test] ~/.config exists!"
fi

# TODO
# install zsh
# chsh -s /usr/bin/zsh
# if .config exists, dont do anything; else, mkdir $HOME/.config
# if -d $HOME/.config/zsh, dont do anything; else, mkdir CONFIG_DIR/zsh
# if -d $HOME/.config/nvim, dont do anything; else, mkdir CONFIG_DIR/nvim
# zshenv symlink
# echo $zdotdir to .zshenv symlink in .config
# if git is not installed, echo "git is not installed. please install git and re-run this script"
# install vim plug
# nvim +PlugInstall +qall ; echo "Installed nvim plugins" (if successful, else echo "failed to install nvim plugins")
# make every existing directory to *.backup
#
# git clone zsh plugins to ~/.config/zsh/plugins
# if [ $? -eq 0 ]; then
    # echo OK
# else
    # echo FAIL
# fi
#
# sudo pacman -S --needed base-devel
# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si
# programs=(list
#      of
#      programs
#      in
#      a
#      array
#  )
# for program in "${programs[@]}"; do
#         sudo pacman -S "$program"
#                 done
# cd $HOME/.local/share/nvim/plugged/vim-hexokinase
# make hexokinase
# cd $HOME
# git clone tpm (tmux) and install plugins
# try installing tmux plugins from cli
