#!/bin/bash

echo "Installing yay..."
cd $HOME
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
rm -rf $HOME/yay-bin
echo "Done"

echo "Installing apps..."

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
    picom-jonaburg-git
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
    espeak-ng
    emacs
    kvantum-qt5
    arc-icon-theme
    nordic-kde-git
    ncdu
    ueberzug
    mpd
    ncmpcpp
    mpc
    copyq
    speedtest-cli
    bitwarden-cli
)

for app in "${apps[@]}"; do
    yes | yay $app
done

echo "Done"

# =============

echo "Installing Emacs..."
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
echo "Done"


echo "Installing cursors..."
cd $HOME
git clone https://github.com/archcraft-os/archcraft-cursors/
cd $HOME/archcraft-cursors/archcraft-cursor-qogirr
makepkg -si
cd $HOME
rm -rf $HOME/archcraft-cursors
echo "Done"
