# Based on lambda theme, reverses git, pwd
# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

#PROMPT='$(git_prompt_info)%{$reset_color%}%~/> ' 
PROMPT='$(git_prompt_info)%{$fg[yellow]%}%m%{$reset_color%}:%~/> ' 
#PROMPT='$(git_prompt_info)%{$fg[cyan]%}%~/>%{$reset_color%} ' 

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
