#!/bin/bash

cd $HOME
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

pacman_apps=(
    neovim
    zsh
    exa
    cmus
    nodejs
    fish
    neofetch
    nnn
    lf
    ranger
    tmux
    cmatrix
    ninvaders
    git
    clang
    tree
    emacs
    man-db
    make
    cmake
    openssh
    bat
    ffmpeg
    figlet
    fortune
    cowsay
    fzf
    golang
    python3
    ncurses
    shellcheck
    unzip
    zip
    firefox
    alacritty
    kitty
    sxiv
    vieb
    lolcat
    htop
    virtualbox
    i3
    i3lock
    feh
    flameshot
    xrandr
    dunst
    sxhkd
    rofi
    libnotify
    picom-ibhagwan-git
    arc-gtk-theme
    w3m
    rtv
    newsboat
    dolphin
    python-pip
    vlc
    mpv
    zathura
    zathura-pdf-mupdf
    youtube-dl
    bat
    pacman-contrib
)

aur_apps=(
    sc-im
    snake
    pacman4console
    moon-buggy
    polybar
    tty-clock
    fet.sh-git
    flashfocus-git
    brave-bin
    brave-beta-bin
    insect
    bibata-cursor-theme

)

for pacman_app in "${pacman_apps[@]}"; do
    yes | pacman -S $pacman_app
done

for aur_app in "${aur_apps[@]}"; do
    yes | paru -S $aur_app
done

npm install --global speed-test
