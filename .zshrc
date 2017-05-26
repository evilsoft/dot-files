# I use Oh My Zsh...Needed for this config
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="evil"
DISABLE_AUTO_UPDATE="true"

plugins=(git git-extras node yarn npm jsontools vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

alias ll='ls --group-directories-first -hl'
alias la='ll -a'

alias gst='git status -sb'
alias gco='git checkout'
alias gcb='gco -b'
alias gca='git commit -am'

alias tmux='tmux -2'
alias ack='ack --pager="less -R"'

alias simplehttp="python -m http.server 3400"

alias dacker="docker-compose build && docker-compose up"
alias dacker-down="docker-compose down && docker-compose rm"
alias dacker-stop="docker-compose kill"
alias dacker-clean="docker volume rm $(docker volume ls -qf dangling=true) && docker rmi $(docker images -f dangling=true -q)"
