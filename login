
setenv EDITOR vim
setenv VISUAL vim

setenv VIMINIT "source $HOME/vimfiles/vimrc"
setenv GVIMINIT "source $HOME/vimfiles/gvimrc"

if ($HOST == "plunk.org") then
    setenv CVSROOT /home/lk/cvsroot
    setenv TOMCAT_HOME /usr/local/jakarta-tomcat-3.2.3
    setenv TOMCAT_OPTS -Xbootclasspath/a:/home/lk/libs/pja.jar
    setenv TZ PST8PDT
    setenv CLASSPATH /home/lk/libs/pja.jar:/home/lk/libs/JimiProClasses.jar:/home/lk/libs/xerces.jar:.

else
    setenv CVSROOT :ext:lk@plunk.org:/home/lk/cvsroot
    setenv CVS_RSH ssh
endif

if ($HOST == "server") then
    setenv X10CONFIG /etc/x10.conf
    setenv P4PORT 1666
    setenv P4USER lawrence
    source $HOME/.p4passwd
    setenv P4CLIENT lawrence-home
endif
