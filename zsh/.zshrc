# tmux 2>/dev/null
[ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1
# tmux new-window -a
pfetch
# arch-fetch
# cd $HOME

files=(
    prompt.zsh
    aliases.zsh
    variables.zsh
    plugins.zsh
    functions.zsh
    keybindings.zsh
    completions.zsh
    options.zsh
    history.zsh
)

for file in "$files[@]"; do
    source ~/.config/zsh/$file
done

# source $HOME/Scripts/sudo.lib
source $HOME/Scripts/doas.lib

# always in end
source ~/.config/zsh/p10k.zsh
