# zsh aliases

# misc
alias chx="chmod +x"
alias k="killall"
alias xwp="xwallpaper --zoom"
alias speet="speedtest-cli --simple"
alias t="touch"
alias diff="/bin/diff --color"
alias curlo="curl -O"
alias bt="bluetoothctl"
alias own="sudo chown -R $USER"
alias mem="free -h"
alias df="/bin/df -h"
alias bat="/bin/bat --color always -p -P"
alias alert="notify-send"

# operations
alias -g WC="| wc -l"
alias -g CP="| xclip -f -selection clip -rmlastnl"
alias -g G="| rg"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g HP="--help | less"

## redirect outputs
alias -g N1="> /dev/null"
alias -g N2="2> /dev/null"
alias -g NO="> /dev/null 2>&1"

# applications
alias i="imv"
alias v="nvim"
alias n="ncmpcpp"
alias m="mpv"
alias p="zathura"
alias pm="pulsemixer"

# mpv
alias mo="mpv --profile=overlay"
alias mq="mpv --profile=hq"
alias mm="mpv --profile=movie"

# directory
alias mkdir="/bin/mkdir -p"
alias md="mkdir"
mdc() { 
  mkdir "$1";
  cd "$1";
}

# navigation
alias ..="cd .." 
alias 2.="cd ../.."
alias 3.="cd ../../.."
alias 4.="cd ../../../.."
alias 5.="cd ../../../../.."

# utilities
alias rm="sudo /bin/rm -v"
alias rmr="rm -rfv"
alias cpr="cp -rfv"
alias cpf="cp -fv"
alias mvf="mv -fv"

# exa
alias lls="/bin/ls"
alias ls="exa --color always"
alias la="exa --color always -a"
alias l1="exa --color always -1a"
alias ll="exa --color always -la"
alias lt="exa --color always -T"
alias lat="exa --color always -T -a"

# mounting
alias lssm="simple-mtpfs -l"
alias smount="simple-mtpfs --device 1"
alias usmount="fusermount -u"

# youtube-dl
alias ytmp3="youtube-dl --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '~/downloads/%(title)s.%(ext)s'"
alias ytdl="youtube-dl --yes-playlist -c -i --retries 4 -f 'mp4[height=720]' -o '~/downloads/%(title)s.%(ext)s'"

# git
alias gi="git init"
alias gn="git config --global user.name"
alias ge="git config --global user.email"
alias gra="git remote add"
alias gcl="git clone"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gcam="git commit --amend"

# custom
alias cdd="cd ~/dotfiles"
alias cdn="cd ~/.config/nvim"
alias vt="nvim +ZenMode ~/documents/todo/todo.txt"
alias gc1="git commit -m 'First commit'"
alias gcu="git commit -m 'Update'"
alias grad="git remote add dotfiles https://github.com/jasper-schnabel/dotfiles" 
alias gran="git remote add neovim https://github.com/jasper-schnabel/neovim" 
alias gpd="git push -u dotfiles master"
alias gpn="git push -u neovim master"
