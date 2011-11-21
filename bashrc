# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PROMPT_COMMAND=~/.bash_prompt
export PS1='[\h]$ '
set -o vi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
[ -d /usr/java/default/bin ] && export PATH=/usr/java/default/bin:$PATH
[ -d /opt/machdb/script ] && export PATH=/opt/machdb/script:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH
[ -d /share/onlive/dist/3rdParty/tools/apache-ant/1.7.1/noarch/bin ] && \
    export PATH=/share/onlive/dist/3rdParty/tools/apache-ant/1.7.1/noarch/bin:$PATH
[ -d /opt/CollabNet_Subversion/bin ] && \
    export PATH=/opt/CollabNet_Subversion/bin:$PATH

# Insert local python lib into PYTHONPATH
[ -d ~/lib/python ] && \
    export PYTHONPATH=~/lib/python:/usr/local/bin

