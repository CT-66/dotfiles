# cat ~/reminders.md
pfetch
# neofetch
# fet.sh

# https://forum.endeavouros.com/t/15116
# cat ~/.cache/.nf 2> /dev/null
# setsid neofetch >| ~/.cache/.nf

. ~/.config/zsh/prompt.zsh
. ~/.config/zsh/aliases.zsh
. ~/.config/zsh/variables.zsh
. ~/.config/zsh/plugins.zsh
. ~/.config/zsh/functions.zsh
source $HOME/Scripts/sudo.lib

autoload -Uz compinit
compinit -d ~/.cache/zsh/zsh_compinit_dumpfiles
_comp_options+=(globdots)		# Autocomplete dotfiles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive tab completion
zstyle ':completion:*' menu select 'm:{a-z}={A-Za-z}' # case insensitive tab completion
unsetopt BEEP
setopt NO_CASE_GLOB # Set case insensitive globbing
# setopt AUTO_CD # Automatically cd into a directory without typing `cd`
unsetopt correct_all
setopt correct # Enable correction
setopt interactivecomments

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


# history stuff
HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS


# compinit

# DISABLE_AUTO_UPDATE="true"
# ENABLE_CORRECTION="true"

# vim mode
bindkey -v
export KEYTIMEOUT=1
zmodload -i zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward
bindkey -M vicmd 'g' vi-beginning-of-line
bindkey -M vicmd 'G' end-of-line
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Yank to the system clipboard
function vi-yank-custom {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -sel clip
}

zle -N vi-yank-custom
bindkey -M vicmd 'y' vi-yank-custom

autopair-init

# bind alt+s -> sudo !!
bindkey -s "^[s" "sudo !!"

function expand-alias() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

# eval "$(bw completion --shell zsh); compdef _bw bw;"

[[ ! -f ~/.config/zsh//.p10k.zsh ]] || source ~/.config/zsh//.p10k.zsh
