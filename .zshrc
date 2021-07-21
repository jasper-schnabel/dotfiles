# zsh config

# prompt, aliases and syntax-highlighting
source $HOME/.config/zsh/prompt.zsh
source $HOME/.config/zsh/aliases.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# basic auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# vi-mode
bindkey -v
export KEYTIMEOUT=1

# envs
export EDITOR="nvim"
export READER="zathura"
export BROWSER="firefox"
export TERMINAL="alacritty"

# history
export HISTSIZE=3000
export SAVEHIST=1000
export HISTFILE="$HOME/.local/share/zsh_history"

# path
export PATH=`du $HOME/.local/share/bin | cut -f2 | tr "\n" ":"`$PATH

# language
export LANG="en_US.UTF-8"

# bat
export BAT_THEME="ansi"

# clipmenu
export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS="50"
export CM_LAUNCHER="dmenu"

# z.lua
eval "`lua /usr/share/z.lua/z.lua --init zsh enhanced once`"
export _ZL_DATA="$HOME/.local/share/zlua"

# color-less
export LESS_TERMCAP_mb=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_md=`tput bold; tput setaf 2`
export LESS_TERMCAP_me=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_so=`tput bold; tput rev; tput setaf 4`
export LESS_TERMCAP_se=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_us=`tput smul; tput bold; tput setaf 4`
export LESS_TERMCAP_ue=`tput sgr0; tput setaf 7`

# cleanuup
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_DOCUMENTS_DIR="$HOME/ct/documents/"
export XDG_DOWNLOAD_DIR="$HOME/Downloads/"
export XDG_MUSIC_DIR="$HOME/ct/music/"
export XDG_PICTURES_DIR="$HOME/ct/pictures/"
export XDG_VIDEOS_DIR="$HOME/ct/videos/"

# autostart xorg
if [ `tty` = /dev/tty1 ]; then
  startx
fi
