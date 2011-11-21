# for all shells

# remove duplicates from path when elements are added:
typeset -U path

function rscreen()
{
    if (( $# != 1 )); then
        echo "Usage: rscreen <hostname>" 2>&1
        return 2
    fi
    ssh $1 -t screen -r
    chpwd
}

# add element to path if it exists, returning 0 on success or 1 on failure
function add_to_path()
{
    if (($# == 0)); then
        echo "Usage: add_to_path <path>"
    else
        if [[ -d $1 ]]; then
            path=($path $1)
            return 0
        fi
    fi

    return 1
}

# prepend element in path if it exists, returning 0 on success or 1 on failure
function prepend_to_path()
{
    if (($# == 0)); then
        echo "Usage: prepend_to_path <path>"
    else
        if [[ -d $1 ]]; then
            path=($1 $path)
            return 0
        fi
    fi

    return 1
}

# for things like local installations of vim.  need to prepend to
# get in front of /usr/bin if it's set by the system.
prepend_to_path ~/usr/bin

# Use CollabNet svn that is keyring aware. This goes before /usr/bin.
prepend_to_path /opt/CollabNet_Subversion/bin

add_to_path ~/bin
add_to_path /usr/java/default/bin
add_to_path /usr/local/bin
add_to_path /usr/local/mysql/bin
add_to_path /sbin
add_to_path /usr/sbin

if host build-netapp02a.onlive.com > /dev/null; then
    # Do not add to path unless NFS server is alive
    add_to_path /share/onlive/dist/3rdParty/tools/apache-ant/1.7.1/noarch/bin
fi

PYTHONPATH=""

# OnLive dev host:
if [ -d $HOME/ol/tools/trunk ]; then
    export OL_SHARE_TOOLS=$HOME/ol/tools/trunk
    export PYTHONPATH="$OL_SHARE_TOOLS/devtools/lib/python:$PYTHONPATH"
fi

if [ -d $HOME/lib/python ]; then
    export PYTHONPATH="$HOME/lib/python:$PYTHONPATH"
fi

# add X11 bin if it exists
if ! add_to_path /usr/bin/X11; then
    add_to_path /usr/X11R6/bin
fi

# try to set the machine-specific home bin path
HOSTNAME=$(print -P '%m')
add_to_path ~/bin/$HOSTNAME

if (( $+HOSTTYPE )); then
    add_to_path ~/bin/$HOSTTYPE
fi
