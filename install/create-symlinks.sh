#!/bin/bash

echo "Creating symlinks..."

dirs=(
    X11
    alacritty
    btop
    dunst
    flashfocus
    gtk-3.0
    gtk-4.0
    htop
    i3
    bspwm
    qtile
    xmonad
    awesome
    spectrwm
    openbox
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
    xplr
    jgmenu
    feh
    fish
    yay
    Thunar
    eww
    ksnip
    bottom
    sway
    hypr
    waybar
    mpDris2
    xkeysnail
    espanso
    warpd
    nvtop
    swhkd
    xremap
    fusuma
    wireplumber
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
ln -s ~/Dotfiles/greenclip/greenclip.toml ~/.config/greenclip.toml
ln -s ~/Dotfiles/xdg/mimeapps.list ~/.config/mimeapps.list
ln -s ~/Dotfiles/xdg/user-dirs.dirs ~/.config/user-dirs.dirs
sudo ln -s /usr/bin/nvim /usr/bin/v
sudo ln -s /usr/bin/nvim /usr/bin/vv
# sudo cp ~/Dotfiles/etc/fstab /etc/fstab
ln -s ~/Dotfiles/paleofetch/paleofetch ~/.local/bin/paleofetch
ln -s ~/Dotfiles/paleofetch2/paleofetch2 ~/.local/bin/paleofetch2
ln -s ~/Dotfiles/applications/autostart ~/.config/autostart
ln -s ~/Dotfiles/nvchad/chadrc.lua ~/.config/nvim/lua/custom/chadrc.lua
ln -s ~/Dotfiles/nvchad/init.lua ~/.config/nvim/lua/custom/init.lua
ln -s ~/Dotfiles/X11/Xresources ~/.Xdefaults

if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi

ln -s ~/Dotfiles/bash/bashrc ~/.bashrc

if [ -f ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.bak
fi

ln -s ~/Dotfiles/zsh/.zshenv ~/.zshenv

if [ -f /etc/pacman.conf ]; then
    mv /etc/pacman.conf /etc/pacman.conf.bak
fi

sudo ln -s ~/Dotfiles/pacman/pacman.conf /etc/pacman.conf


if [ ! -d ~/.config/gnupg ]; then
    mkdir ~/.config/gnupg
fi

if [ ! -d ~/.cache/wget ]; then
    mkdir ~/.cache/wget
fi

if [ ! -d /etc/nohang ]; then
    sudo mkdir /etc/nohang
fi



# symlinking config files for systemd related stuff breaks them, so just manually copy them instead
if [ -f /etc/xdg/reflector/reflector.conf ]; then
    mv /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.bak
fi

sudo cp ~/Dotfiles/pacman/reflector.conf /etc/xdg/reflector/reflector.conf

sudo cp ~/Dotfiles/nohang/nohang.conf /etc/nohang/nohang.conf
sudo cp ~/Dotfiles/nohang/nohang-desktop.conf /etc/nohang/nohang-desktop.conf


echo "Done"
