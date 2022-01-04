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

# Use lf to switch directories and bind it to ctrl-o
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

# ranger_cd() {
#     temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
#     ranger --choosedir="$temp_file" -- "${@:-$PWD}"
#     if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
#         cd -- "$chosen_dir"
#     fi
#     rm -f -- "$temp_file"
# }

extract () {
    if [ -f $1 ]; then
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

wallp () {
    feh --bg-fill ~/Pictures/Wallpapers/$1.*
}

hgrep () {
    cat ~/.cache/zsh/history | \grep -in --color=auto "$1"
}
