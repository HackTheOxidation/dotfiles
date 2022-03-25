#!/usr/bin/env bash 

# Compositor
killall picom
picom --config ~/.config/picom/picom.conf --vsync &

# Other programs
lxpolkit &
/usr/bin/emacs --daemon &
nm-applet &

