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
# alt+h/l instead to left/right arrows
# bindkey "^[h" backward-char
# bindkey "^[l" forward-char
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
bindkey -s "^[." " !* ^Xa " # `^Xa`: tab (automatically expands !*)
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
bindkey -s "^[s" "sudo !!^Xa " # `^Xa`: tab (automatically expands !!)
# press tab to expand aliases
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored
# zsh history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down
# undo, redo (`u`, `U`)
bindkey -M vicmd "u" undo
bindkey -M vicmd "U" redo
# ctrl+j/k instead of up/down arrows
bindkey "^J" history-substring-search-down
bindkey "^K" history-substring-search-up
# ctrl+space to accept autosuggestion
bindkey "^ " autosuggest-accept
# alt+space to accept and execute autosuggestion
# bindkey "^[ " autosuggest-execute

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

# clipboard depending on X11 or wayland
function clipboard-copy {
    if [ "$XDG_SESSION_TYPE" = "wayland" ]
    then
        wl-copy "$1"
    else
        echo "$1" | xclip -sel clip
    fi
}

# Yank to the system clipboard
function vi-yank-custom {
    zle vi-yank
   clipboard-copy "$CUTBUFFER"
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

# # exit the shell and return to ranger (to be used after pressing `S` in ranger)
# __ () {
#     exit
# }

# open ranger in current directory
_ () {
    ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`\cat $HOME/.cache/.rangerdir`; cd $LASTDIR
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

bindkey -s '^[f' '_\n' # alt+f -> ranger
bindkey -s '^[z' '__\n' # alt+z -> exit the shell inside ranger
bindkey -s '^[^F' 'lf_cd\n' # ctrl+alt+f -> lf

# display dots when waiting for tab completion list
expand-or-complete-with-dots() {
    echo -n "\e[31m...\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# fzf
# CTRL-T - Paste the selected file path(s) into the command line
zle     -N   fzf-file-widget
bindkey '^T' fzf-file-widget

# CTRL-R - Paste the selected command from history into the command line
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# ~~ALT-C~~ ALT-X - cd into the selected directory
zle -N fzf-cd-widget
bindkey '\ex' fzf-cd-widget

# ctrl+shift+left/right arrow -> select previous/next word
# shift+left/right arrow -> select previous/next character
# shift+home/end -> select till first/last character
# y -> copy selected text
r-delregion() {
  if ((REGION_ACTIVE)) then
     zle kill-region
  else
    local widget_name=$1
    shift
    zle $widget_name -- $@
  fi
}

r-deselect() {
  ((REGION_ACTIVE = 0))
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

r-select() {
  ((REGION_ACTIVE)) || zle set-mark-command
  local widget_name=$1
  shift
  zle $widget_name -- $@
}

for key     kcap   seq        mode   widget (
    sleft   kLFT   $'\e[1;2D' select   backward-char
    sright  kRIT   $'\e[1;2C' select   forward-char

    send    kEND   $'\E[1;2F' select   end-of-line
    send2   x      $'\E[4;2~' select   end-of-line

    shome   kHOM   $'\E[1;2H' select   beginning-of-line
    shome2  x      $'\E[1;2~' select   beginning-of-line

    left    kcub1  $'\EOD'    deselect backward-char
    right   kcuf1  $'\EOC'    deselect forward-char

    end     kend   $'\EOF'    deselect end-of-line
    end2    x      $'\E4~'    deselect end-of-line

    home    khome  $'\EOH'    deselect beginning-of-line
    home2   x      $'\E1~'    deselect beginning-of-line

    csleft  x      $'\E[1;6D' select   backward-word
    csright x      $'\E[1;6C' select   forward-word
    csend   x      $'\E[1;6F' select   end-of-line
    cshome  x      $'\E[1;6H' select   beginning-of-line

    cleft   x      $'\E[1;5D' deselect backward-word
    cright  x      $'\E[1;5C' deselect forward-word

    del     kdch1   $'\E[3~'  delregion delete-char
    bs      x       $'^?'     delregion backward-delete-char

  ) {
  eval "key-$key() {
    r-$mode $widget \$@
  }"
  zle -N key-$key
  bindkey ${terminfo[$kcap]-$seq} key-$key
}

zle -N widget::copy-selection

# copy selected terminal text to clipboard
function widget::copy-selection {
    if ((REGION_ACTIVE)); then
        zle copy-region-as-kill
            # printf "%s" $CUTBUFFER | xclip -sel clip
            clipboard-copy "$CUTBUFFER"
    fi
}

# cut selected terminal text to clipboard
zle -N widget::cut-selection
function widget::cut-selection() {
    if ((REGION_ACTIVE)) then
        zle kill-region
        # printf "%s" $CUTBUFFER | xclip -sel clip
        clipboard-copy "$CUTBUFFER"
    fi
}

# paste clipboard contents
zle -N widget::paste
function widget::paste() {
    ((REGION_ACTIVE)) && zle kill-region
    RBUFFER="$(xclip -sel clip -o)${RBUFFER}"
    CURSOR=$(( CURSOR + $(echo -n "$(xclip -sel clip -o)" | wc -m | bc) ))
}

# select entire prompt
zle -N widget::select-all
function widget::select-all() {
    local buflen=$(echo -n "$BUFFER" | wc -m | bc)
    CURSOR=$buflen   # if this is messing up try: CURSOR=9999999
    zle set-mark-command
    while [[ $CURSOR > 0 ]]; do
        zle beginning-of-line
    done
}

# ctrl+a -> select all text
bindkey "^a" widget::select-all
# ctrl+x -> cut selected text
bindkey "^x" widget::cut-selection
# ctrl+y -> copy selected text
bindkey '^y' widget::copy-selection
# ctrl+v -> paste selection
bindkey "^v" widget::paste
# ctrl+z -> undo
bindkey "^z" undo
