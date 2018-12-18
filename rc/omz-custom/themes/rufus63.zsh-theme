# ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe "
   BEGIN {
      binmode STDIN,  ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
   }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g
")
} 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

#PROMPT='%{$fg[cyan]%}%D{%H:%M:%S}%{$reset_color%} $(gcloud_prompt_info)$(git_prompt_info) %{$fg[green]%}$(_fishy_collapsed_wd)%{$reset_color%}:%(!.#.zsh->) '
PROMPT='%{$fg[cyan]%}%D{%H:%M:%S}%{$reset_color%} $(git_prompt_info) %{$fg[green]%}$(_fishy_collapsed_wd)%{$reset_color%}:%(!.#.zsh->) '
RPROMPT=''
