# alias grep="rg -in --color=always"

# Make a directory and switch to it immediately
mcd() {
    mkdir "$1"
    cd "$1"
}

extract () {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.bz2)  tar xjf "$1"      ;;
            *.tar.gz)   tar xzf "$1"      ;;
            *.tar.xz)   tar xf "$1"       ;;
            *.bz2)      bunzip2 "$1"      ;;
            *.rar)      rar x "$1"        ;;
            *.gz)       gunzip "$1"       ;;
            *.tar)      tar xf "$1"       ;;
            *.tbz2)     tar xjf "$1"      ;;
            *.tgz)      tar xzf "$1"      ;;
            *.zip)      unzip "$1"        ;;
            *.Z)        uncompress "$1"   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

wallp () {
    feh --bg-fill ~/Pictures/Wallpapers/"$1".*
}

hgrep () {
    cat ~/.cache/zsh/history | grep "$1"
}

lgrep () {
    \ls -a | grep "$1"
}

cgrep () {
    \cat "$1" | grep "$2"
}

bak (){
    if [ -f "$1" ]; then
        if [ -f "$1.bak" ]; then
            echo "ERROR: File \"$1.bak\" already exists"
        else
            cp "$1" "$1.bak"
            echo "Backup of file \"$1\" created"
        fi
    else
        echo "ERROR: File \"$1\" doesn't exist"
    fi
}

function mksh() {
    if echo "$1" | \grep -q ".sh" > /dev/null; then
        filename="$1"
    elif [ "$1" = "" ]; then
        echo "ERROR: No filename given"
        # exit 1
        return 1
    else
        filename="$1.sh"
    fi
    if [ -f "$filename" ]; then
        echo "ERROR: File already exists"
        # exit 1
        return 1
    else
        touch "$filename"
    fi
    chmod +x "$filename"
    echo "#!/bin/bash\n\n" >> "$filename"
    # read -p "Edit script '$filename'? " prompt
    read "prompt?Edit script '$filename'? "
    case $prompt in
        y|yes)
            $EDITOR "$filename"
            ;;
        n|no)
            :
            return 0
            ;;
        *)
            echo "Invalid input"
            # exit 1
            return 1
            ;;
    esac
}

# edit dotfiles
function de() {
    if [ "$1" = "" ]; then
        $EDITOR "$(\find ~/Dotfiles -type f | fzf)"
    else
        $EDITOR "$(\find ~/Dotfiles -type f | fzf --query $1)"
    fi
}
