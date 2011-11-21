# .bash_profile

[ -f ~/.bash_functions ] && . ~/.bash_functions
[ -f ~/ol_setup.sh ] && . ~/ol_setup.sh
[ -f ~/.bashrc ] && . ~/.bashrc

if [ -n "$OL_SITE" ]; then
    export OL_WINDOW_TITLE="$OL_SITE:${OL_SLA}-${OL_SITE_TYPE}-site $OL_HOST_ALIAS"
fi

export GNOME_KEYRING_ENV_FILE="$HOME/.gnome-keyring-env"
[ -f $GNOME_KEYRING_ENV_FILE ] && source $GNOME_KEYRING_ENV_FILE

alias ls='ls --file-type'
