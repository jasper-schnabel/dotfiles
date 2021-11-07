# zsh exports

# environment variables
export USERHOME="/home/jasper"
export EDITOR="nvim"
export READER="zathura"
export BROWSER="firefox"
export TERMINAL="alacritty"
export PATH=`du $USERHOME/.local/share/bin | cut -f2 | tr "\n" ":"`$PATH
export LANG="en_US.UTF-8"

# history
export HISTSIZE=3000
export SAVEHIST=1000
export HISTFILE="$HOME/.local/share/zsh_history"

# bat
export BAT_THEME="ansi"

# clipmenu
export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS="50"
export CM_LAUNCHER="dmenu"

# colorize manpages
export LESS_TERMCAP_mb=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_md=`tput bold; tput setaf 2`
export LESS_TERMCAP_me=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_so=`tput bold; tput rev; tput setaf 4`
export LESS_TERMCAP_se=`tput sgr0; tput setaf 7`
export LESS_TERMCAP_us=`tput smul; tput bold; tput setaf 4`
export LESS_TERMCAP_ue=`tput sgr0; tput setaf 7`

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
