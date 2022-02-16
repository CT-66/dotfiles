pfetch
# cd $HOME

files=(
    prompt.zsh
    aliases.zsh
    variables.zsh
    plugins.zsh
    functions.zsh
)

for file in "$files[@]"; do
    source ~/.config/zsh/$file
done

# source $HOME/Scripts/sudo.lib
source $HOME/Scripts/doas.lib

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
HISTSIZE=1000 # number of lines stored loaded into memory at memory
SAVEHIST=10000 # number of lines stored in history file (~/.cache/zsh/history)
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again
setopt HIST_FIND_NO_DUPS # Do not display a line previously found
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space


# dirstack (type `dirs -v` and cd -<NUM>)
autoload -Uz add-zsh-hook
DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]]
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack
DIRSTACKSIZE='20'
setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# DISABLE_AUTO_UPDATE="true"
# ENABLE_CORRECTION="true"

# vim mode
bindkey -v
export KEYTIMEOUT=1
zmodload -i zsh/complist

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
bindkey -M menuselect '^[[Z' reverse-menu-complete
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char
# ctrl+r -> reverse history search
bindkey '^R' history-incremental-search-backward
# press g or G to go to beginning/end of line (similar to gg/G in vim)
bindkey -M vicmd 'g' vi-beginning-of-line
bindkey -M vicmd 'G' end-of-line
# press left/right arrow in vim mode to go to beginning/end of line
bindkey -M vicmd "^[[D" beginning-of-line
bindkey -M vicmd "^[[C" end-of-line
# ctrl+w
bindkey -M vicmd "^W" "vi-backward-kill-word"
bindkey "^W" backward-kill-word
# ctrl+backspace
bindkey -M vicmd "^H" "vi-backward-kill-word"
bindkey "^H" backward-kill-word
# alt+. -> inserts argument of previous command
bindkey -M vicmd "^[[." "insert-last-word"
bindkey "^[[." insert-last-word
# ctrl+left/right
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5D" backward-word
bindkey -M vicmd "^[[1;5C" forward-word
# alt+left to go to the parent directory
bindkey -s "^[[1;3D" "cd ../\n"


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

# bind alt+s -> sudo !!
# bindkey -s "^[s" "sudo !!"
bindkey -s "^[s" "doas !!"

# press tab to expand aliases
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored

zstyle ':completion:*' regular true
zstyle ':completion:*' rehash true

autopair-init
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
