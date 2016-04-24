# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color

PROMPT='%F{32}%c%f %{$fg_bold[blue]%}$(git_prompt_info)
%{$fg_bold[white]%}💀  %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}(%f%F{124}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘%F{154})%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%F{154})"
