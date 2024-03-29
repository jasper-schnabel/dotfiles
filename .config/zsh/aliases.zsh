# zsh aliases

# misc
alias chx="chmod +x"
alias xwp="xwallpaper --zoom"
alias t="touch"
alias diff="/bin/diff --color"
alias curlo="curl -O"
alias bt="bluetoothctl"
alias own="sudo chown -R $USER"
alias mem="free -h"
alias df="/bin/df -h"
alias bat="/bin/bat --color always -p -P"
alias alert="notify-send"
alias clp="colorpicker --short --preview --one-shot"
alias upm="sudo reflector --country Germany --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias btub="sudo rfkill unblock all"
calc () {
  node -e "console.log($@)"
}

# operations
alias -g WC="| wc -l"
alias -g CP="| xclip -f -selection clip -rmlastnl"

## redirect outputs
alias -g N1="> /dev/null"
alias -g N2="2> /dev/null"
alias -g NO="> /dev/null 2>&1"

# applications
alias i="nsxiv"
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
alias cp="/bin/cp -v"
alias mv="/bin/mv -v"
alias rmr="rm -rfv"
alias cpr="cp -rfv"
alias cpf="cp -fv"
alias mvf="mv -fv"

# exa
alias lls="/bin/ls"
alias ls="exa --color always"
alias ld="exa --color always -D"
alias la="exa --color always -a"
alias l1="exa --color always -1a"
alias ll="exa --color always -la"
alias lt="exa --color always -T"
alias lat="exa --color always -T -a -I='*.git'"

# mounting
alias lssm="simple-mtpfs -l"
alias smount="simple-mtpfs --device 1"
alias usmount="fusermount -u"

# youtube-dl
alias ytmp3="youtube-dl -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '~/Downloads/%(title)s.%(ext)s'"
alias ytmp3p="youtube-dl --yes-playlist -c -i --retries 4 -x --audio-format 'mp3' --audio-quality '320K' -o '~/Downloads/%(playlist_title)s/%(title)s.%(ext)s'"
alias ytdl="youtube-dl -c -i --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(title)s.%(ext)s'"
alias ytdlp="youtube-dl --yes-playlist -c -i --retries 4 -f 'mp4[height=720]' -o '~/Downloads/%(playlist_title)s/%(title)s.%(ext)s'"
ytmp3pn() {
  youtube-dl --yes-playlist -c -i --retries 4 --playlist-items "$2" -x --audio-format 'mp3' --audio-quality '320K' -o '~/Downloads/%(playlist_title)s/%(title)s.%(ext)s' "$1"
}

# custom
alias cdd="cd ~/code/dotfiles"
alias cdn="cd ~/.config/nvim"
alias todo="nvim +ZenMode ~/ct/documents/todo"
alias gn="git config --global user.name"
alias ge="git config --global user.email"
alias gran="git remote add origin https://github.com/jasper-schnabel/neovim-lua"
alias grad="git remote add origin https://github.com/jasper-schnabel/dotfiles"
alias gcl="git clone"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push -u origin main"
