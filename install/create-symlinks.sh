#!/bin/bash

dirs=(
    alacritty
    bpytop
    btop
    dunst
    flameshot
    flashfocus
    gtk-3.0
    htop
    i3
    kitty
    lsd
    neofetch
    nvim
    picom
    polybar
    rofi
    tmux
    zsh
    ranger
    bat
)

if [ -d ~/.config ]; then
do
    mv ~/.config ~/config.bak
done


for dir in "${dirs[@]}"; do
	ln -s ~/Dotfiles/$dir ~/.config/$dir
done

echo "Done"

ln -s ~/Dotfiles/xinitrc ~/.xinitrc
ln -s ~/Dotfiles/Xmodmap ~/.Xmodmap
ln -s ~/Dotfiles/Xresources ~/.Xresources
