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
    xmonad
    awesome
    spectrwm
    openbox
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
    Kvantum
    qt5ct
    mpd
    ncmpcpp
    calcurse
    sxhkd
    mpv
    cava
    lf
    newsboat
    plank
    lvim
    nvchad
    deadd
    xplr
    jgmenu
    autokey
    feh
    fish
    yay
)

 if [ -d ~/.config ]; then
     mv ~/.config ~/config.bak
 fi

 mkdir ~/.config


for dir in "${dirs[@]}"; do
	ln -s ~/Dotfiles/$dir ~/.config/$dir
done

mkdir ~/.config/VSCodium
ln -s ~/Dotfiles/VSCodium/User ~/.config/VSCodium/User
ln -s ~/Dotfiles/VSCodium/product.json ~/.config/VSCodium/product.json
sudo ln -s /usr/bin/codium /usr/bin/code
ln -s ~/Dotfiles/fonts ~/.local/share/fonts
ln -s ~/Dotfiles/applications ~/.local/share/applications
# ln -s ~/Dotfiles/doom ~/.emacs.d
sudo mv /usr/share/icons/default/index.theme /usr/share/icons/default/index.theme.bak
sudo ln -s ~/Dotfiles/icons/default/index.theme /usr/share/icons/default/index.theme
ln -s ~/Dotfiles/Scripts ~/Scripts
ln -s ~/Dotfiles/stalonetray/stalonetrayrc ~/.stalonetrayrc
ln -s ~/Dotfiles/betterlockscreen/betterlockscreenrc ~/.config/betterlockscreenrc
ln -s ~/Dotfiles/xdg/mimeapps.list ~/.config/mimeapps.list
sudo ln -s /usr/bin/nvim /usr/bin/v
sudo ln -s ~/Dotfiles/pacman/pacman.conf /etc/pacman.conf

if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
ln -s ~/Dotfiles/bash/bashrc ~/.bashrc

if [ -f ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.bak
fi

ln -s ~/Dotfiles/zsh/.zshenv ~/.zshenv


echo "Done"
