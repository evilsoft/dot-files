# I use Oh My Zsh...Needed for this config
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git rails ruby yum debian rvm npm jsontools gem encode64 bundler colored-man)

source $ZSH/oh-my-zsh.sh

alias clr='clear'
alias ll='ls --group-directories-first -hl'
alias la='ll -a'

alias gst='git status -sb'
alias gco='git checkout'
alias gcb='gco -b'
alias gca='git commit -am'
