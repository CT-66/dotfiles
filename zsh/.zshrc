# tmux 2>/dev/null
# [ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1
# tmux new-window -a
# pfetch
# paleofetch
paleofetch2
# cd $HOME

files=(
    prompt.zsh
    aliases.zsh
    variables.zsh
    plugins.zsh
    completions.zsh
    functions.zsh
    keybindings.zsh
    options.zsh
    history.zsh
)

for file in "$files[@]"; do
    source ~/.config/zsh/$file
done

# source $HOME/Scripts/sudo.lib
# source $HOME/Scripts/doas.lib

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# always in end
source ~/.config/zsh/p10k.zsh
