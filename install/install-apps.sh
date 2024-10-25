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
    eza
    nodejs
    fish
    neofetch
    pfetch
    fet.sh-git
    lf-bin
    ranger
    tmux
    vscodium-bin
    vscodium-bin-marketplace
    vscodium-bin-features
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
    fortune-mod
    cowsay
    fzf
    go
    python3
    ncurses
    shellcheck
    unzip
    zip
    firefox-developer-edition
    firefox
    brave-bin
    falkon
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
    xorg-xrandr
    dunst
    sxhkd
    rofi
    rofi-greenclip
    rofi-emoji
    noto-fonts-emoji
    ttf-unifont
    adobe-source-han-sans-jp-fonts
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
    haruna
    zathura
    zathura-pdf-mupdf
    zathura-cb
    okular
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
    btop
    bottom
    xorg-xinit
    xorg-xev
    xorg-server-xephyr
    xorg-xmodmap
    xorg-setxkbmap
    python-pynvim
    jq
    neovide
    timeshift
    qt5ct-kde
    # qt5ct
    # betterlockscreen
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
    prettier
    ffmpegthumbnailer
    gzip
    xclip
    diskus
    hyperfine
    trash-cli
    plank
    plank-theme-bigsur
    thunar
    tumbler
    gimp
    inkscape
    krita
    plasma
    plasma-desktop
    # kde-applications
    kdeplasma-addons
    plasma-pa
    plasma-nm
    ksnip
    gwenview
    latte-dock
    konsave
    xfce4
    xfce4-goodies
    notify-send-py
    duf
    dust
    xplr
    dragon-drop
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
    i3-easyfocus-git
    rsync
    xcolor
    gnome-clocks
    kclock
    renameutils
    neovim-symlinks
    onefetch
    moreutils
    ripgrep
    ascii-image-converter
    absolutely-proprietary
    gallery-dl
    tokei
    imagemagick
    konsole
    xdg-desktop-portal
    xdg-desktop-portal-kde
    xdg-desktop-portal-gtk
    eww-git
    rustup
    rust-analyzer
    nsxiv
    yad
    qbittorrent
    sway
    swaybg
    foot
    waybar
    xorg-xwayland
    wev
    wl-clipboard
    kdialog
    exiv2
    perl-image-exiftool
    kate
    expect
    ghostwriter
    mpdris2
    plasma-browser-integration
    akregator
    kwin-bismuth-bin
    lightly-qt
    sysstat
    normcap
    xkeysnail
    kdocker
    reflector
    archlinux-keyring
    libreoffice-fresh
    proton-vpn-gtk-app
    pdfarranger
    foliate
    arianna
    espanso-bin
    aria2
    pdfgrep
    p7zip
    kbt
    warpd
    vimv-git
    localsend-bin
    kwin-polonium
    plasma-active-accent-decorations
    radeontop
    nvtop
    obsidian
    swhkd-bin
    xremap-kde-bin
    lact
    ruby-fusuma
    nohang
    libadwaita-without-adwaita-git
    picard
    kwin-effect-rounded-corners-git
    lightlyshaders-plasma6-git
    corectrl
    hyprland
    hyprpaper
    # qalculate-qt
    qalculate-gtk
    portmaster-stub-bin
    clonezilla
    partclone
    zram-generator
    kruler
    zorin-desktop-themes
    zorin-icon-themes
    keepassxc
    mission-center
    ungoogled-chromium-bin
    vorta
    upscayl-bin
    mkvtoolnix-cli
    sublime-text-4
    icdiff
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
cd ~/.cache/tmp/repos/archcraft-cursors/archcraft-cursor-qogirr
makepkg -si
cd $HOME
echo "Done"

echo "Installing additional zsh plugins..."
cd $HOME
git clone --depth 1 https://github.com/MichaelAquilina/zsh-auto-notify ~/.cache/tmp/repos/zsh-auto-notify
sudo mv ~/.cache/tmp/repos/zsh-auto-notify /usr/share/zsh/plugins

echo "Installing openbox themes..."
cd $HOME
git clone --depth 1 https://github.com/archcraft-os/archcraft-themes ~/.cache/tmp/repos/archcraft-themes
cd ~/.cache/tmp/repos/archcraft-themes/archcraft-gtk-theme-arc
makepkg -si
cd $HOME
echo "Done"

sudo cp /usr/share/icons/breeze/apps/16/utilities-terminal.svg /usr/share/icons/Arc/apps/16/utilities-terminal.svg
