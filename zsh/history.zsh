# history stuff
HISTSIZE=1000 # number of lines stored loaded into memory at memory
SAVEHIST=10000 # number of lines stored in history file (~/.cache/zsh/history)
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # Don't record an entry that was just recorded again
setopt HIST_FIND_NO_DUPS # Do not display a line previously found
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space
setopt EXTENDED_HISTORY # Record timestamp of each command
