# for interactive shells

# Run ssh-agent if not already running. We kill it in zlogout. We test
# the auth sock variable (rather than the agent PID) because we don't
# want to clobber any variables that are set by agent forwarding.
if [ -z "$SSH_AUTH_SOCK" ] || [ ! -r $SSH_AUTH_SOCK ]; then
    eval `ssh-agent` >/dev/null
fi

# Make a well-known softlink to the temporary socket so
# that existing processes (in screen sessions) 
# can continue to authenticate
if [ "$SSH_AUTH_SOCK" != "$HOME/.ssh/auth_sock" ]; then
    ln -sf $SSH_AUTH_SOCK $HOME/.ssh/auth_sock
    export OLD_SSH_AUTH_SOCK=$SSH_AUTH_SOCK
    export SSH_AUTH_SOCK=$HOME/.ssh/auth_sock
fi

# make option and trap changes local to functions
setopt LOCAL_OPTIONS LOCAL_TRAPS

# when there's an ambiguous completion, offer the first one right away
#setopt MENU_COMPLETE

# don't beep on ambiguous completion
unsetopt LIST_BEEP

# Treat the #, ~ and ^ characters as part of patterns for filename generation, etc.
setopt EXTENDED_GLOB

# Long history.
HISTSIZE=60
# Normally "history" is "fc -l", which only shows the last 16 entries.
# We force the entries to start at 1 (and end at the current entry).
alias history='fc -l 1'

# remove redundant entries in path, cdpath, etc.
typeset -U path cdpath manpath fpath mailpath

# emacs editing
#bindkey -e
# vi editing
bindkey -v

# basic aliases
alias vi=vim
ERROR_OUTPUT=/tmp/errors.mk

# allows "mmv *.c *.cpp", etc.
alias mmv='noglob zmv -W'

# for "ls" variants
# MK: command not installed in Mac OS (fink?)
if type -p dircolors > /dev/null; then
	eval `dircolors ~/rc/dir_colors`
	LS_OPTIONS=(--classify --color=auto)
	alias l='command ls ${LS_OPTIONS} -o --human-readable'
	alias ls='command ls ${LS_OPTIONS}'
	lt() {
		command ls ${LS_OPTIONS} --color=always -ot --human-readable $* | head
	}
fi

# bash-ism
bindkey '^R' history-incremental-search-backward

# expand history when space is typed
bindkey ' ' magic-space

# imitate the tcsh run-fg-editor function
function run-fg-editor() {
    # see if there are any jobs to run
    local COUNT=$(jobs | grep + | wc -l)

    # actually, the above doesn't work, because you can't pipe
    # "jobs" into anything.  So fake it.  Maybe we'll come up
    # with something better later.
    COUNT=1

    if (( COUNT == 0 )); then
        # nothing to do
    else
        zle push-input
        # note that I don't involve $EDITOR.  Sometimes a program (such
        # as "p4 submit" invokes my editor and I want to be able to ^Z
        # back to it too.
        BUFFER="fg"
        zle accept-line
    fi
}
zle -N run-fg-editor
bindkey '^Z' run-fg-editor

# don't set cdpath because tab-completion uses it, which sucks:
# cdpath=($cdpath $HOME $SRCROOT)

# set the prompt, using yellow for successful commands and red (with exit
# code) for unsuccessful commands.
YELLOW_PROMPT='%{[33;1m%}'
RED_PROMPT='%{[31;1m%}'
NORMAL_PROMPT='%{[0m%}'

PROMPT="${YELLOW_PROMPT}%m%#${NORMAL_PROMPT} "

# put the exit code on the right.  I've disabled this because I never
# looked at it anyway.  I think RPROMPT stands for "right prompt".
# RPROMPT="%(?..${RED_PROMPT}(%?%)${NORMAL_PROMPT})"

# functions for Kaleidescape
alias po='p4 opened -c default'
function grepsrcnow() {
    if (($# == 0)); then
        echo "Usage: grepsrcnow <word>"
        echo "After the grep, type 'e' to edit those files."
    else
        CURRENT_PWD=$PWD

        cd $SRCROOT
        echo "make[1]: Entering directory \`$SRCROOT'" > $ERROR_OUTPUT
        egrep --line-number $* */*.[ch]pp */*/*.[ch]pp | \
            tee --append $ERROR_OUTPUT
        echo "make[1]: Leaving directory \`$SRCROOT'" >> $ERROR_OUTPUT

        cd $CURRENT_PWD
    fi
}
function grepsrc() {
    if (($# == 0)); then
        echo "Usage: grepsrc <word>"
        echo "After the grep, type 'e' to edit those files."
    else
        CURRENT_PWD=$PWD

        cd $SRCROOT
        echo "make[1]: Entering directory \`$SRCROOT'" > $ERROR_OUTPUT
        egrep $* ALL_LINES | tee --append $ERROR_OUTPUT
        echo "make[1]: Leaving directory \`$SRCROOT'" >> $ERROR_OUTPUT

        cd $CURRENT_PWD
    fi
}
function grepdir() {
    if (($# == 0)); then
        echo "Usage: grepdir <word>"
        echo "After the grep, type 'e' to edit those files."
    else
        echo "make[1]: Entering directory \`$PWD'" > $ERROR_OUTPUT
        # The (N) means it's okay to not match anything.  The /dev/null
        # is in case none of them match.
        egrep --line-number $* *.[ch]pp(N) *.cc(N) *.hh(N) /dev/null | tee --append $ERROR_OUTPUT
        echo "make[1]: Leaving directory \`$PWD'" >> $ERROR_OUTPUT
    fi
}

# functions for developing
alias e='vi -q'
ant() {
    command ant -find build.xml $* |& tee $ERROR_OUTPUT

    # return just the status of "ant", we don't care about the status of "tee"
    return $pipestatus[0]
}

# a more useful version of run-help from the 'functions' directory
alias run-help='so that unalias does not complain if not aliased'
unalias run-help
autoload run-help

# other useful things to autoload
autoload zmv	# better move

# super completion.  unfortunately this takes a while to load
# disabled -- it was sometimes taking too long to complete, too
# autoload compinit
# compinit

# when completing after a CD-type command, complete only directories
# or links to directories:
compctl -/ cd chdir dirs pushd

# environment variables
export EDITOR=vim
export VISUAL=vim

#export VIMINIT="source $HOME/vimfiles/vimrc"
#export GVIMINIT="source $HOME/vimfiles/gvimrc"

# to help with SVN commands (e.g., "svn status $SVN_DIRS")
ALL_SVN_DIRS=(~/rc ~/text ~/bin ~/vimfiles ~/text-private ~/code)
SVN_DIRS=()
for i in $ALL_SVN_DIRS
do
    if [[ -d $i ]]; then
        SVN_DIRS=($SVN_DIRS $i)
    fi
done
unset ALL_SVN_DIRS

# Set the Putty window title.
function title()
{
    if [ "$1" = "" ]; then
        echo "Usage: title window_title"
    else
        /bin/echo -n -e "\033]0;$1\007"
    fi
}

chpwd() {
	[[ -t 1 ]] || return
	case $TERM in
		sun-cmd) print -Pn "\e]l%~\e\\" ;;
		*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a" ;;
		screen) print -Pn "\e_%m:%~\e\\" ;;
	esac
}

cd .
