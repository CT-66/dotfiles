# Make a directory and switch to it immediately
mcd() {
    mkdir $1
    cd $1
}

# open ranger in current directory
_ () {
    ranger --choosedir=$HOME/.cache/.rangerdir; LASTDIR=`\cat $HOME/.cache/.rangerdir`; cd $LASTDIR
}

# exit the shell and return to ranger (to be used after pressing `S` in ranger)
__ () {
    exit
}

lf_cd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^F' '_\n' # ctrl+f
bindkey -s '^Z' '__\n' # exit the shell inside ranger
bindkey -s '^[^F' 'lf_cd\n' # ctrl+alt+f

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
    cat ~/.cache/zsh/history | \grep -inaI --color=auto "$1"
}

lgrep () {
    \ls -a | \grep -inaI --color=auto "$1"
}

cgrep () {
    \cat "$1" | grep -inaI --color=auto "$2"
}
