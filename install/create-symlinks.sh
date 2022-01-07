#!/bin/bash

echo "Creating symlinks..."

dirs=(
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
)

 if [ -d ~/.config ]; then
     mv ~/.config ~/config.bak
 fi

 mkdir ~/.config


for dir in "${dirs[@]}"; do
	ln -s ~/Dotfiles/$dir ~/.config/$dir
done

ln -s ~/Dotfiles/Xmodmap ~/.Xmodmap
ln -s ~/Dotfiles/Xresources ~/.Xresources
ln -s ~/Dotfiles/fonts ~/.local/share/fonts
ln -s ~/Dotfiles/applications ~/.local/share/applications
ln -s ~/Dotfiles/emacs.d ~/.emacs.d
sudo mv /usr/share/icons/default/index.theme /usr/share/icons/default/index.theme.bak
sudo ln -s ~/Dotfiles/icons/default/index.theme /usr/share/icons/default/index.theme
ln -s ~/Dotfiles/bin ~/Scripts
# sudo ln -s ~/Dotfiles/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.old
# sudo ln -s ~/Dotfiles/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
# sudo ln -s ~/Dotfiles/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

if [ -f ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.bak
fi

ln -s ~/Dotfiles/zsh/.zshenv ~/.zshenv


cp ~/Dotfiles/sddm/theme.conf /etc/sddm.conf.d/theme.conf
rm /usr/share/sddm/themes/sugar-dark/theme.conf
cp ~/Dotfiles/sddm/sugar-dark-theme.conf /usr/share/sddm/themes/sugar-dark/theme.conf



echo "Done"
