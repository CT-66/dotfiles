alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ZZ='exit'
alias ZQ='exit'
# alias pls='sudo $(fc -ln -1)'
# alias please='sudo $(fc -ln -1)'
alias pls='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'
# alias v=nvim
alias codium="/usr/bin/codium --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland --new-window"
alias v=codium
alias vv="nvim"
alias vim=nvim
alias cmatrix="cmatrix -bs -C blue"
# alias .date='date +"%d %b, %Y | %I:%M %p"'
 alias .date='date +"%a %b %d | %I:%M %p"'
# alias grep="grep -inI --color=auto"
alias rg="rg -in --color=always"
alias grep=rg
alias find='fd'
alias diff='icdiff -Ns'
alias .history='nvim ~/.cache/zsh/history'
alias mkf='touch'
alias sv='sudoedit'
alias htop='btm --basic'
alias h=htop
alias b=btop
alias ranger='ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`\cat $HOME/.cache/.rangerdir`; cd $LASTDIR'
alias r=ranger
alias tty-clock='tty-clock -cbt -C 4'
alias bw-list='bw list items --pretty --search'
alias cat='bat --paging=never'
alias catp='bat --paging=always'
alias less='bat --paging=always'
alias f=fzf
alias vf='nvim $(fzf)'
alias mf='mpv "$(fzf)"'
alias espeak=espeak-ng
alias e=emacs
alias ncdu='ncdu --color dark'
alias speedtest='speedtest-cli --simple'
alias rss=newsboat
alias wall="feh --bg-scale"
alias ncmp=ncmpcpp
# alias df='df -h'
alias df='duf --hide-fs tmpfs'
# alias du='dust -br'
alias du='du -sh'
# alias sctl='sudo systemctl'
alias sctl='sudo systemctl'
alias qmv='qmv -fv do'
alias bulkrename=qmv
alias sxiv=nsxiv
alias wget=aria2c
alias download=wget
alias kde_screenlock='/usr/lib/kscreenlocker_greet'
alias restart-pulseaudio='pulseaudio -k'

alias _neofetch='\neofetch'
alias _pfetch='\pfetch'
alias neofetch=paleofetch
alias pfetch=paleofetch2
alias nf="clear && neofetch | lolcat"
alias pf="clear && pfetch | lolcat"
alias fet="fet.sh"

# alias p='sudo pacman'
alias P='sudo pacman'
alias Syu='sudo pacman -Syu'
alias y=yay
alias S='yay -S'
alias Rns='yay -Rns'
alias Qq='yay -Qq'
alias Qqg='yay -Qq | grep '
alias Ps='yay -Ps'

alias g=git
alias gp='git add . && git commit -m "$(date +"%d %b, %Y | %I:%M %p")" && git push -u origin master'
alias gc='git clone --depth 1'
alias gcg='git clone --depth 1 https://github.com/'
alias gd='git diff'
alias gs='git status'

alias xclip="xclip -sel clip"
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"
alias yp="pwd | copy"

alias b64=base64
alias b64d='base64 -d'
alias b32=base32
alias b32d='base32 -d'

# -P: display progress bar; same as --partial --progress
# -r: recursive
# -v: verbose
# -h: output numbers in human readable format
# --progress: print a simple progress bar for individual files
# --info=stats1,progress2
# stats1: display transfer statistics with verbosity level 1
# progress2: prints total transfer progress instead of per-file transfer progress
# --modify-window=1: when comparing the timestamps of two files, treat their timestamps as being equivalent if their timestamps have a difference of less than 1 second
# -a: groups these options- copy symlinks as symlinks, not files (-l), preserve permissions (-p), preserve time (-t), preserve group (-g), preserve owner (-o), devices (-D) # use only for backup purposes
alias rsync='rsync -Pv -h --progress --info=stats1,progress2 --modify-window=1 -a'

alias cd..='cd ../'
alias ..='cd ../'
alias .2='cd ../../'
alias ...='cd ../../../'
alias .3='cd ../../../'
alias ....='cd ../../../../'
alias .4='cd ../../../../'
alias .....='cd ../../../../../'
alias .5='cd ../../../../../'

alias mkdir='mkdir -pv'
alias mkd=mkdir

alias chmod="chmod --preserve-root"
alias chown="chown --preserve-root"
alias chgrp="chgrp --preserve-root"
alias c+x='chmod +x '
alias c-x='chmod -x '

# -1: displays one file per line (--oneline)
# -F: display if a file is a directory, executable, normal file, symlink, fifo or socket (--classify)
# -b: list file sizes with binary prefixes (kb, mb, gb, etc.)
# -m: modified time
# -U: created time
#"%a %d %b %Y, %I:%M %p"
# alias eza='eza -1Fb --color=always --icons --group-directories-first -mU'
alias eza='eza -1b -F --color=always --icons --group-directories-first -mU ' # -F is moved to a separate flag instead of being combined with `1b` due to a new bug in recent versions. functionality is unchanged.
alias exa='eza'
alias ls='eza'
alias l='ls'
alias la='ls -a'
alias ll='ls -l --header --group'
alias lla='ll -a'
alias lg='ls -aG' # -G: grid (eza specific)
alias lt='ls -aT' # -T: tree (eza specific)
# alias l.='eza -1Fa | egrep -in "^\."'
# alias l.='\ls -Ap | egrep -in "^\."'
alias l.='\ls -Ap | rg "^\."'
alias lsfzf='ls | fzf --ansi'

alias ping='ping -c 5'

alias zshrc='nvim ~/.config/zsh/.zshrc'
alias .aliases='nvim ~/.config/zsh/aliases.zsh'
alias zsh-aliases='nvim ~/.config/zsh/aliases.zsh'
alias zsh-variables='nvim ~/.config/zsh/variables.zsh'
alias zsh-plugins='nvim ~/.config/zsh/plugins.zsh'
alias zsh-prompt='nvim ~/.config/zsh/prompt.zsh'
alias zsh-functions='nvim ~/.config/zsh/functions.zsh'
alias zsh-exports='nvim ~/.config/zsh/exports.zsh'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vim-plugins='nvim ~/.config/nvim/plugins.vim'
alias vim-plugins-settings='nvim ~/.config/nvim/plugins-settings.vim'
alias vim-plugins-settings-lua='nvim ~/.config/nvim/lua/plugins-settings.lua'
alias vim-keymaps='nvim ~/.config/nvim/keymaps.vim'
alias xresources='nvim ~/.config/X11/Xresources'
alias tmux-settings='nvim ~/.config/tmux/tmux.conf'
alias i3rc='nvim ~/.config/i3/config'
alias sxhkdrc='nvim ~/.config/sxhkd/sxhkdrc'
alias polybar-config='nvim ~/.config/polybar/config'
alias startup.sh='nvim ~/Dotfiles/startup.sh'

alias reload-xresources='xrdb -remove * && xrdb -merge ~/.config/X11/Xresources'

alias py=python3
alias python=python3
# alias pip=pip3

alias ytdl="yt-dlp"
alias yt-dl="yt-dlp"
alias yt-dl-mp3="yt-dlp --extract-audio --audio-format mp3"
alias yt-dl-playlist="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\""

# tmux
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias t=tmux
alias tls='tmux list-sessions'
alias ta='tmux attach -t '
alias tmux-ks='tmux kill-session'
alias tn='tmux new-session -s '

alias open=xdg-open

alias radeontop="radeontop --color --transparency"

alias d.="nohup dolphin . >/dev/null 2>&1 &"

alias vimv="EDITOR=nvim vimv"
