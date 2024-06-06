ZDOTDIR=$HOME/.config/zsh/

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverc"
# export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/lesshst"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export WGETRC="$XDG_CACHE_HOME/wget/wgetrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"

export LS_COLORS='no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:';

export KEYTIMEOUT=1
export EDITOR=codium
export VISUAL=codium
export TERMINAL=konsole
export TERMCMD=konsole
export BROWSER="firefox-developer-edition"
export PAGER='bat --paging=always'
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging=always --style=header,numbers --color=always --theme=\"OneHalfDark\"'"
export MANROFFOFT="-c"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# https://github.com/zsh-users/zsh-autosuggestions/issues/544
export ZSH_AUTOSUGGEST_MANUAL_REBIND="anything"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#545862,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=#bf616a,bold'
export AUTO_NOTIFY_THRESHOLD=10
# export AUTO_NOTIFY_EXPIRE_TIME=10000000
export AUTO_NOTIFY_EXPIRE_TIME=10000

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--reverse
--border=rounded
--cycle
--bind ctrl-h:backward-char
--bind ctrl-l:forward-char
--bind ctrl-g:first
--bind ctrl-alt-g:last
--bind ctrl-f:page-down
--bind ctrl-b:page-up
--bind ctrl-d:half-page-down
--bind ctrl-u:half-page-up
--color=dark
--padding=1
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion

export EXA_ICON_SPACING=2

export PATH="$HOME/Scripts:$HOME/.local/bin:$PATH:$HOME/.emacs.d/bin"
# export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=kde

export ELECTRON_TRASH=trash-cli code

# export GTK_USE_PORTAL=1 # disabled since it breaks the cursor while using firefox on wayland, and the initial purpose of this flag meant for the file picker is solved by using portals
export GDK_DEBUG=portals

export TERM="xterm-256color"

export WLR_NO_HARDWARE_CURSORS=1

export QTWEBENGINE_CHROMIUM_FLAGS=--blink-settings=forceDarkModeEnabled=true

# qt fractional scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1

# firefox
export MOZ_USE_XINPUT2=1
export MOZ_ENABLE_WAYLAND=1
