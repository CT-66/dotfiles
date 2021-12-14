alias ZZ='exit'
alias ZQ='exit'
alias pls='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'
alias v=nvim
alias vim=nvim
alias nf="neofetch | lolcat"
alias cmatrix="cmatrix -bs -C blue"
# alias .date='date +"%d %b, %Y | %I:%M %p"'
 alias .date='date +"%a %d %b | %I:%M %p"'
alias grep="grep -in --color=auto"
alias find='find -iname'
alias .history='nvim ~/.cache/zsh/history'
alias g=git
alias p='sudo pacman'
alias yay=paru
alias sv='sudoedit'
alias h=htop
alias b=btop
alias r=ranger
alias tty-clock='tty-clock -cbt -C 4'
alias gp='git add . && git commit -m "$(date +"%d %b, %Y | %I:%M %p")" && git push -u origin master'
alias gc='git clone'
alias bw-list='bw list items --pretty --search'
alias cat=bat
alias vf='nvim $(fzf)'
alias mf='mpv "$(fzf)"'
alias espeak=espeak-ng
alias e=emacs

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

# alias ls='nnn -de'
alias f=fzf

alias exa='exa -1Fb --color=always --icons --group-directories-first --no-permissions --no-user'
alias ls='exa -1Fb --color=always --icons --group-directories-first --no-permissions --no-user'
alias l='exa -1Fb --color=always --icons --group-directories-first --no-permissions --no-user'
alias ll='exa -1Falb --color=always --icons --group-directories-first --no-permissions --no-user'
alias la='exa -1Fab --color=always --icons --group-directories-first --no-permissions --no-user'
alias lg='exa -1FabG --color=always --icons --group-directories-first --no-permissions --no-user'
alias lt='exa -1FabT --color=always --icons --group-directories-first --no-permissions --no-user'
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

alias tmux-settings='nvim ~/.config/tmux/tmux.conf'

alias py=python
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
