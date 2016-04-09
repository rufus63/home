# Based on lambda theme, reverses git, pwd
# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

#PROMPT='$(git_prompt_info)%{$fg[yellow]%}%m%{$reset_color%}:%~/> ' 

PROMPT='%{$fg[green]%}[%D{%H:%M:%S}]%{$reset_color%} $(git_prompt_info).../%{$fg[green]%}%c zsh->%{$reset_color%} '

XPROMPT=$'
%{$fg[green]%}[%D{%H:%M:%S}]%{$reset_color%} $(git_prompt_info)%n@%m:%{$fg[green]%}%~%{$reset_color%}
%{$fg[cyan]%}zsh->%{$reset_color%} '
