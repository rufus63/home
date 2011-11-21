#!/bin/sh

xrdb $HOME/.Xresources
xsetroot -solid grey30

if [ "$HOSTNAME" = "server" ]; then
    if [ "$VNCDESKTOP" = "kde" -o 1 ]; then
        # export QTDIR=~/kde3.1.2
        # export KDEDIRS=~/kde3.1.2

        # export LD_LIBRARY_PATH=~/kde3.1.2/lib
        # export PATH=~/kde3.1.2/bin:$PATH

        # export KDEHOME=~/.kde3.1.2

        startkde
    else
        xterm -geometry 80x23+0+0 -ls &
        xterm -geometry 80x23+0-0 -ls &
        xterm -geometry 80x49-0+0 -ls &

        if [ -f /usr/bin/enlightenment ]; then
            enlightenment
        else
            twm
        fi
    fi
fi

if [ "$HOSTNAME" = "mvdev" ]; then
    xrdb -merge $HOME/rc/Xresources.neelypcx
    xterm -geometry 80x30+0+0 -ls -title "Window1" &
    xterm -geometry 80x30+0-0 -ls -title "Window2" &
    xterm -geometry 80x40+200+50 -ls -title "Window3" &
    xterm -geometry 80x51-0+0 -ls -title "Window4" &
    twm
fi


