# zsh config

# import exports, aliases and the prompt
source "$HOME/exports.zsh"
source "$USERHOME/.config/zsh/aliases.zsh"
source "$HOME/prompt.zsh"

# load plugin for syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# disable ctrl-s to freeze terminal
stty stop undef

# disable paste highlighting
zle_highlight=("paste:none")

# basic auto/tab completion
autoload -U compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# use TAB/S-TAB and vim keys to navigate in the completion menu
bindkey -M menuselect '^[[Z' vi-up-line-or-history
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# enable vim-mode for zsh
bindkey -v
export KEYTIMEOUT=1

# keybindings
bindkey -s "^f" 'sk --height=20% --color=16,pointer:4 | xclip -f -selection clip -rmlastnl^M'
bindkey -s "^n" 'nvim `sk --height=20% --color=16,pointer:4`^M'
bindkey -s "^o" 'cd `fd -H -td | sk --height=20% --color=16,pointer:4`^M'

# z.lua
eval "`lua /usr/share/z.lua/z.lua --init zsh enhanced once`"
export _ZL_DATA="$HOME/.local/share/zlua"
