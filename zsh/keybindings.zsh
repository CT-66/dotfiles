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
# ctrl+j/k instead of up/down arrows
bindkey "^J" down-history
bindkey "^K" up-history
# alt+h/l instead to left/right arrows
bindkey "^[h" backward-char
bindkey "^[l" forward-char
bindkey -M vicmd "^[h" "backward-char"
bindkey -M vicmd "^[l" "forward-char"
# ctrl+w
bindkey -M vicmd "^W" "vi-backward-kill-word"
# alt+w
bindkey "^[w" backward-kill-word
# ctrl+backspace
bindkey -M vicmd "^H" "vi-backward-kill-word"
bindkey "^H" backward-kill-word
# alt+. -> inserts argument of previous command
# bindkey -M vicmd "^[[." "insert-last-word"
# bindkey "^[[." insert-last-word
bindkey -s "^[." " !$"
# ctrl+left/right arrow
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5D" backward-word
bindkey -M vicmd "^[[1;5C" forward-word
# alt+left/right arrow (similar to ctrl+left/right arrow)
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey -M vicmd "^[[1;3D" "backward-word"
bindkey -M vicmd "^[[1;3C" "forward-word"
# alt+right/left
# bind alt+s -> sudo !!
# bindkey -s "^[s" "sudo !!"
bindkey -s "^[s" "doas !!"
# press tab to expand aliases
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored
# zsh history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down
# ctrl+space to accept autosuggestion
bindkey "^ " autosuggest-accept
# alt+space to accept and execute autosuggestion
bindkey "^[ " autosuggest-execute

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

# enable history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# open ranger in current directory
_ () {
    ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`\cat $HOME/.cache/.rangerdir`; cd $LASTDIR
}

# exit the shell and return to ranger (to be used after pressing `S` in ranger)
__ () {
    exit
}

# open lf in current directory
lf_cd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^[f' '_\n' # ctrl+f -> ranger
bindkey -s '^[z' '__\n' # ctrl+z -> exit the shell inside ranger
bindkey -s '^[^F' 'lf_cd\n' # ctrl+alt+f -> lf

# display dots when waiting for tab completion list
expand-or-complete-with-dots() {
    echo -n "\e[31m...\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
