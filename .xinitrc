#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# increase keyboard speed
xset r rate 250 50

exec tmuxinator start admin &
exec redshift -P &
exec picom -c -i 1.0 -D 0 -r 12 &
exec xwallpaper --zoom ~/Pictures/wallpaper.jpg &
exec sxhkd &
exec dwmblocks &

# Start dwm with restart behaviour
while true; do
    dwm >/dev/null 2>&1
done
