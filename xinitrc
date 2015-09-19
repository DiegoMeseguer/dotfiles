#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# Start the window manager and components:

feh --bg-scale /home/slackware/Pictures/wallpaper.png &
compton --config /home/slackware/.compton.conf -b &
xclock -d -brief -face "Source Code Pro-9" -geometry 50x26+1870+0 &
#xbattmon -p top -t 4 &
#xbacklight -set 40 &
xscreensaver -no-splash &
exec /usr/bin/cwm
