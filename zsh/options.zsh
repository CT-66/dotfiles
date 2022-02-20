unsetopt BEEP # turn off beeps
unsetopt HIST_BEEP # do not beep when a widget attempts to access non-existent history entry
setopt NO_CASE_GLOB # Set case insensitive globbing
unsetopt AUTO_CD # DO NOT automatically cd into a directory without typing `cd`
unsetopt correct_all # do not correct arguments of commands
setopt correct # Enable correction only for commands
setopt interactivecomments # `#` will be treated as a comment

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
