plugins_dir='/usr/share/zsh/plugins'

plugins=(
    zsh-autosuggestions/zsh-autosuggestions.zsh
    zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    zsh-history-substring-search/zsh-history-substring-search.zsh
    zsh-autopair/autopair.zsh
    zsh-auto-notify/auto-notify.plugin.zsh
)

for plugin in "$plugins[@]"; do
    source $plugins_dir/$plugin
done

autopair-init
