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
    nodejs
    fish
    neofetch
    pfetch
    fet.sh-git
    lf-bin
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
    bspwm
    qtile
    xmonad
    awesome
    openbox
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
    pcmanfm-qt
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
    flashfocus-git
    brave-bin
    brave-beta-bin
    insect
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
    rofi-greenclip
    speedtest-cli
    bitwarden-cli
    bitwarden
    btop
    xorg-xinit
    ueberzug
    python-pynvim
    jq
    neovide-git
    timeshift
    qt5ct-kde
    qt5ct
    betterlockscreen
    networkmanager
    network-manager-applet
    nm-connection-editor
    numlockx
    rtv
    calcurse
    github-cli
    github-desktop-bin
    xdotool
    breeze
    breeze-icons
    breeze-gtk
    vim-plug
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-autopair-git
    zsh-theme-powerlevel10k-bin-git
    brightnessctl
    alternating-layouts-git
    pamixer
    dos2unix
    cava
    xorg-server-xephyr
    tmpmail-git
    bar-protonmail
    prettier
    ffmpegthumbnailer
    gzip
    xclip
    xorg-xev
    diskus
    hyperfine
    trash-cli
    plank
    plank-theme-bigsur
    autokey-gtk
)

# for app in "${apps[@]}"; do
#     yes | yay $app
# done

str=""
for app in "${apps[@]}"; do
    str+=" "
    str+=$app
done

yay -S $str --noconfirm

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

echo "Installing openbox themes.."
cd $HOME
git clone https://github.com/archcraft-os/archcraft-themes
cd $HOME/archcraft-themes/archcraft-gtk-theme-arc
makepkg -si
cd $HOME
rm -rf $HOME/archcraft-themes
echo "Done"
