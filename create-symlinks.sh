#!/bin/bash

dirs=(
alacritty
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
)

for dir in "${dirs[@]}"; do
	ln -s ~/Dotfiles/$dir ~/.config/$dir
done

echo "Done"
