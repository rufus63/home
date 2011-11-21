# share our SSH_AUTH_SOCK, but only if we push it
function share_ssh_auth() {
    local MAYBE_SSH_AUTH_SOCK="$HOME/.ssh/auth_sock"
    ## check that $SSH_AUTH_SOCK is set
    if [ -z "$SSH_AUTH_SOCK" ]; then
       echo '$SSH_AUTH_SOCK is not set';
    ## ...and that $SSH_AUTH_SOCK is not already $MAYBE_SSH_AUTH_SOCK
    elif [ "$SSH_AUTH_SOCK" = "$MAYBE_SSH_AUTH_SOCK" ]; then
       echo '$SSH_AUTH_SOCK is already $MAYBE_SSH_AUTH_SOCK';
    ## ...and that $SSH_AUTH_SOCK is actually a socket
    elif [ ! -S "$SSH_AUTH_SOCK" ]; then
       echo '$SSH_AUTH_SOCK is not a socket';
       ls -lad "$SSH_AUTH_SOCK";
    ## ...and that $HOME/.ssh exists and is a directory
    elif [ ! -d $(dirname "$MAYBE_SSH_AUTH_SOCK") ]; then
       echo $(dirname "$MAYBE_SSH_AUTH_SOCK")' is not a directory';
       ls -lad $(dirname "$MAYBE_SSH_AUTH_SOCK")
    else
       ## link them
       echo "linking '$MAYBE_SSH_AUTH_SOCK' to '$SSH_AUTH_SOCK'"
       ln -sf "$SSH_AUTH_SOCK"  "$MAYBE_SSH_AUTH_SOCK"
       ## re set SSH_AUTH_SOCK
       echo "setting SSH_AUTH_SOCK='$MAYBE_SSH_AUTH_SOCK'"
       export SSH_AUTH_SOCK="$MAYBE_SSH_AUTH_SOCK"
    fi
}


function resolve_ip() {
    host $1 | tail -1 | awk '{print $NF}'
}
