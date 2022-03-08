autoload -Uz compinit
compinit -d ~/.cache/zsh/zsh_compinit_dumpfiles
_comp_options+=(globdots)		# Autocomplete dotfiles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive tab completion
zstyle ':completion:*' menu select 'm:{a-z}={A-Za-z}' # case insensitive tab completion
zstyle ':completion:*' regular true
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on # use cache to speed up commands
zstyle ':completion:*' cache-path "~/.cache/zsh/.zcompcache"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1F --color=always --icons --group-directories-first $realpath'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
