# zsh prompt

# needes to work
setopt PROMPT_SUBST
setopt PROMPT_SP

# prompt char
prompt_char () {
  echo -n '%B%{%F{white}%}> %b'
}

# hostname if connected via SSH
get-user-host() {  
  [ -n '$SSH_CLIENT' ] && echo -n '%B%{%F{magenta}%} %n@%M %b'
}

# pwd
get-pwd() {
  echo -n '%B%{%F{blue}%} %~ %b'
}

# git
get-git-info() { 
  local git_branch=`git symbolic-ref --short HEAD 2> /dev/null`
  if [[ -n '$git_branch' ]]; then
    if [ -z '$(git status --porcelain)' ]; then
      git_color='green'
    else
      git_color='yellow'
    fi
    echo -n '%B%{%F{$git_color}%}$git_branch  %b'
  fi
}

# prompt
PROMPT='$(get-user-host; get-pwd; get-git-info; prompt_char)'
