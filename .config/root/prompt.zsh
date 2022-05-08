# zsh prompt

# needed to work
setopt PROMPT_SUBST
setopt PROMPT_SP

# prompt character
prompt_char () {
  echo -n "%B%{%F{white}%}> %b"
}

# current working directory
get-pwd() {
  echo -n "%B%{%F{red}%} %~ %b"
}

# git info
get-git-info() {
  local git_branch=`git symbolic-ref --short HEAD 2> /dev/null`
  if [[ -n "$git_branch" ]]; then
    if [ -z "$(git status --porcelain)" ]; then
      git_color="green"
    else
      git_color="yellow"
    fi
    echo -n "%B%{%F{$git_color}%}$git_branch  %b"
  fi
}

# assemble prompt
PROMPT='$(get-pwd; get-git-info; prompt_char)'
