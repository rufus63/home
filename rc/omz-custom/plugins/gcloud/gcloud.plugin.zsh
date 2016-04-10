# ZSH Git Prompt Plugin from:
# http://github.com/rufus63/zsh-gcloud-prompt
# Inspired by
# http://github.com/olivierverdier/zsh-git-prompt

__GCLOUD_PROMPT_DIR="${0:A:h}"
__GCLOUD_ACTIVE_CONFIG_FILE=$HOME/.config/gcloud/active_config

function preexec_update_gcloud_vars() {
    case "$2" in
        gcloud*)
        __EXECUTED_GCLOUD_COMMAND=1
        ;;
    esac
}

function updated_gcloud_active_config() {
  local active_config=$(< $__GCLOUD_ACTIVE_CONFIG_FILE)
  if [ "$ZSH_THEME_GCLOUD_ACTIVE_CONFIG" != $active_config ]; then
    ZSH_THEME_GCLOUD_ACTIVE_CONFIG=$active_config
    return 0
  fi
  return 1
}

function precmd_update_gcloud_vars() {
    if [ -n "$__EXECUTED_GCLOUD_COMMAND" ] || updated_gcloud_active_config; then
        update_current_gcloud_vars
        unset __EXECUTED_GCLOUD_COMMAND
    fi
}

precmd_functions+=(precmd_update_gcloud_vars)
preexec_functions+=(preexec_update_gcloud_vars)

## Function definitions
function update_current_gcloud_vars() {
    unset __CURRENT_GCLOUD_STATUS

    local gcloud_status="$__GCLOUD_PROMPT_DIR/gcloud_status.py"
    _GCLOUD_STATUS=$(python ${gcloud_status} 2>/dev/null)
    __CURRENT_GCLOUD_STATUS=("${(@s: :)_GCLOUD_STATUS}")
    ZSH_THEME_GCLOUD_PROJECT=$__CURRENT_GCLOUD_STATUS[1]
}

function gcloud_prompt_info() {
    precmd_update_gcloud_vars
    if [ -n "$__CURRENT_GCLOUD_STATUS" ]; then
      STATUS="$ZSH_THEME_GCLOUD_PROMPT_PREFIX$ZSH_THEME_GCLOUD_PROMPT_PROJECT$ZSH_THEME_GCLOUD_PROJECT"
      STATUS="$STATUS$ZSH_THEME_GCLOUD_PROMPT_SUFFIX"
      echo $STATUS
    fi
}

# Default values for the appearance of the prompt.
ZSH_THEME_GCLOUD_PROMPT_PREFIX="["
ZSH_THEME_GCLOUD_PROMPT_SUFFIX="]"
ZSH_THEME_GCLOUD_PROMPT_PROJECT=
ZSH_THEME_GCLOUD_PROMPT_ACTIVE_CONFIG=
