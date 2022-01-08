#!/bin/bash

echo "Creating symlinks..."

dirs=(
    X11
    alacritty
    btop
    dunst
    flameshot
    flashfocus
    gtk-3.0
    htop
    i3
    bspwm
    qtile
    awesome
    openbox
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
    doom
    Code/User
    Kvantum
    qt5ct
    mpd
    ncmpcpp
    calcurse
    sxhkd
    mpv
    betterlockscreenrc
    cava
    lf
    newsboat
    plank
    lvim
    nvchad
)

 if [ -d ~/.config ]; then
     mv ~/.config ~/config.bak
 fi

 mkdir ~/.config


for dir in "${dirs[@]}"; do
	ln -s ~/Dotfiles/$dir ~/.config/$dir
done

ln -s ~/Dotfiles/fonts ~/.local/share/fonts
ln -s ~/Dotfiles/applications ~/.local/share/applications
ln -s ~/Dotfiles/emacs.d ~/.emacs.d
sudo mv /usr/share/icons/default/index.theme /usr/share/icons/default/index.theme.bak
sudo ln -s ~/Dotfiles/icons/default/index.theme /usr/share/icons/default/index.theme
ln -s ~/Dotfiles/Scripts ~/Scripts
ln -s ~/Dotfiles/Scripts/autokey ~/.config/autokey/data

if [ -f ~/.xinitrc ]; then
    mv ~/.xinitrc ~/.xinitrc.bak
fi
ln -s ~/Dotfiles/X11/xinitrc ~/.xinitrc

if [ -f ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.bak
fi

ln -s ~/Dotfiles/zsh/.zshenv ~/.zshenv


echo "Done"
