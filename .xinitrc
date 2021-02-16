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

# functions

# start some nice programs
#slstatus
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 11 "key +ctrl z -ctrl"
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 8 "key +ctrl - -ctrl"
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 3 "key +ctrl + -ctrl" 
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 9 "key b" 
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 10 "key e"
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 1 "key +ctrl k -ctrl" 
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 2 "key +ctrl t -ctrl" 
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 12 "key +ctrl d -ctrl" 
xsetwacom set HID\ 256c:006e\ Pad\ pad Button 13 "key +ctrl p -ctrl" 
urxvtd --quiet --opendisplay --fork &
xrandr --output DVI-D-0 --mode 1920x1080 -r 144 &
nitrogen --restore &
wal -R -a 70 &
slstatus &
exec dwm
