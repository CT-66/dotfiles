# Make a directory and switch to it immediately
mcd() {
    mkdir $1
    cd $1
}

files_to_be_removed=(.viminfo .bash_history .node_repl_history .lesshst .wget-hsts .xsession-errors .xsession-errors.old)

for file in "${files_to_be_removed[@]}"; do
    if [ -f "$HOME/$file" ]; then
        rm -r "$HOME/$file"
    fi
done

# Use lf (or ranger) to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.tar.xz)   tar xf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

trash () {
    mv "$1" "$HOME/.Trash"
}

wallp () {
    feh --bg-fill ~/Pictures/Wallpapers/$1.*
}
