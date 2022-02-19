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
# alt+h/l instead to left/right arrows
bindkey "^[h" backward-char
bindkey "^[l" forward-char
bindkey -M vicmd "^[h" "backward-char"
bindkey -M vicmd "^[l" "forward-char"
# ctrl+w
bindkey -M vicmd "^W" "vi-backward-kill-word"
# bindkey "^W" backward-kill-word
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
