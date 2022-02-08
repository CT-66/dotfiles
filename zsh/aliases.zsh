alias ZZ='exit'
alias ZQ='exit'
alias pls='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'
alias v=nvim
alias vim=nvim
alias nf="clear && neofetch | lolcat"
alias pf="clear && pfetch | lolcat"
alias cmatrix="cmatrix -bs -C blue"
# alias .date='date +"%d %b, %Y | %I:%M %p"'
 alias .date='date +"%a %d %b | %I:%M %p"'
alias grep="grep -ina --color=auto"
alias find='fd'
alias .history='nvim ~/.cache/zsh/history'
alias mkf='touch'
alias g=git
alias p='sudo pacman'
alias sv='sudoedit'
alias h=htop
alias b=btop
alias ranger='ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`\cat $HOME/.cache/.rangerdir`; cd $LASTDIR'
alias r=ranger
alias tty-clock='tty-clock -cbt -C 4'
alias gp='git add . && git commit -m "$(date +"%d %b, %Y | %I:%M %p")" && git push -u origin master'
alias gc='git clone'
alias gcg='git clone https://github.com/'
alias gd='git diff'
alias gs='git status'
alias bw-list='bw list items --pretty --search'
alias cat=bat
alias f=fzf
alias vf='nvim $(fzf)'
alias mf='mpv "$(fzf)"'
alias espeak=espeak-ng
alias e=emacs
alias ncdu='ncdu --color dark'
alias speedtest='speedtest-cli --simple'
alias rss=newsboat
alias wall="feh --bg-scale"
alias xclip="xclip -sel clip"
alias ncmp=ncmpcpp
alias df='duf'
alias du='dust -br'
alias sctl='sudo systemctl'

alias cd..='cd ../'
alias ..='cd ../'
alias .2='cd ../../'
alias ...='cd ../../../'
alias .3='cd ../../../'
alias ....='cd ../../../../'
alias .4='cd ../../../../'
alias .....='cd ../../../../../'
alias .5='cd ../../../../../'

alias mkdir='mkdir -p'

alias exa='exa -1Fb --color=always --icons --group-directories-first --no-permissions --no-user'
alias ls='exa'
alias l='ls'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -a'
alias lg='ls -aG'
alias lt='ls -aT'
# alias l.='exa -1Fa | egrep -in "^\."'
alias l.='\ls -Ap | egrep -in "^\."'

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
alias reload-xresources='xrdb -remove * && xrdb -merge ~/.config/X11/Xresources'

alias tmux-settings='nvim ~/.config/tmux/tmux.conf'

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
alias t-ls='tmux list-sessions'
alias tls='tmux list-sessions'
alias tmux-ls='tmux list-sessions'
alias tmux-ks='tmux kill-session'
