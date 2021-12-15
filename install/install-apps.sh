#!/bin/bash

cd $HOME
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

apps=(
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
    yt-dlp
    bat
    pacman-contrib
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
    youtube-dl-gui-git
    espeak-ng
    emacs
    kvantum-qt5
    arc-icon-theme
    nordic-kde-git
    ncdu
    ueberzug
    mpd
    ncmpcpp
)

for app in "${apps[@]}"; do
    yes | paru -S $app
done

npm install --global speed-test


git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
