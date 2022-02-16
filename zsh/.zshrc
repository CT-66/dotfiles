pfetch
# cd $HOME

files=(
    prompt.zsh
    aliases.zsh
    variables.zsh
    plugins.zsh
    functions.zsh
    keybindings.zsh
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

zstyle ':completion:*' regular true
zstyle ':completion:*' rehash true

autopair-init
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
