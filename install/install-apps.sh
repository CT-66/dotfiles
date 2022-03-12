#!/bin/bash

mkdir -p ~/.cache/tmp/repos

echo "Installing yay..."
sudo pacman -S --needed git base-devel
git clone --depth 1 https://aur.archlinux.org/yay-bin.git ~/.cache/tmp/repos/yay-bin
cd yay-bin
makepkg -si
cd $HOME
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
    vscodium-bin
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
    fd
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
    vieb
    lolcat
    htop
    virtualbox
    i3-gaps
    bspwm
    qtile
    xmonad
    awesome
    spectrwm
    openbox
    leftwm
    feh
    flameshot
    xrandr
    dunst
    sxhkd
    rofi
    rofi-greenclip
    rofi-emoji
    libnotify
    picom-jonaburg-git
    arc-gtk-theme
    arc-icon-theme
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
    nordic-theme
    ncdu
    ueberzug
    mpd
    ncmpcpp
    mpc
    speedtest-cli
    bitwarden-cli
    bitwarden
    btop
    xorg-xinit
    xorg-xev
    xorg-server-xephyr
    xorg-xmodmap
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
    zsh-history-substring-search
    fzf-tab-git
    brightnessctl
    alternating-layouts-git
    pamixer
    dos2unix
    cava
    tmpmail-git
    bar-protonmail
    prettier
    ffmpegthumbnailer
    gzip
    xclip
    diskus
    hyperfine
    trash-cli
    plank
    plank-theme-bigsur
    autokey-gtk
    thunar
    tumbler
    gimp
    inkscape
    krita
    plasma-desktop
    kde-applications
    konsave
    deadd-notification-center-bin
    notify-send-py
    duf
    dust
    xplr
    dragon-drag-and-drop
    flatpak
    links
    xournalpp
    sd
    tealdeer
    obs-studio
    jgmenu
    obmenu-generator
    gotop
    qutebrowser
    vieb-bin
    stalonetray
    python-feedparser
    pavucontrol-qt
    i3-layouts
    opendoas
    i3-easyfocus-git
    rsync
    xcolor
    gnome-clocks
    renameutils
    neovim-symlinks
    onefetch
    moreutils
    ripgrep
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
git clone --depth 1 https://github.com/archcraft-os/archcraft-cursors/ ~/.cache/tmp/repos/archcraft-cursors
cd ~/.cache/tmp/repos/archcraft-cursors
makepkg -si
cd $HOME
echo "Done"

echo "Installing additional zsh plugins..."
cd $HOME
git clone --depth 1 https://github.com/MichaelAquilina/zsh-auto-notify
sudo mv $HOME/zsh-auto-notify /usr/share/zsh/plugins

echo "Installing openbox themes..."
cd $HOME
git clone --depth 1 https://github.com/archcraft-os/archcraft-themes ~/.cache/tmp/repos/archcraft-themes
cd ~/.cache/tmp/repos/archcraft-themes/archcraft-gtk-theme-arc
makepkg -si
cd $HOME
echo "Done"
