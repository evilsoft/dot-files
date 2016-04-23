# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="evil"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

plugins=(git npm archlinux git-extras node)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export LANG=en_US.UTF-8
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

alias ll='ls --group-directories-first -hl'
alias la='ll -a'

alias gst='git status -sb'
alias gco='git checkout'
alias gcb='gco -b'
alias gca='git commit -am'

alias tmux='tmux -2'
alias ack='ack --pager="less -R"'

alias single_display="xrandr --output LVDS1 --mode 1366x768 --primary --auto"
alias double_display="xrandr --output LVDS1 --mode 1366x768 --primary --auto --output HDMI1 --mode 1920x1080 --right-of LVDS1 --auto && nitrogen --restore"
