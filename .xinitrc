#!/bin/sh

xset s 900 # blank screen when inactive for 15 minutes
# xset -dpms
xrandr --dpi 96
setxkbmap -layout us,ru -option grp:caps_toggle
# wmname LG3D
# xrdb -merge ~/.Xresources
# wal -i ~/.dotfiles/assets/wallpapers/4.jpg &
setbg $WALLPAPERS/8.jpg &
picom --config ~/.config/picom/picom.conf &
eval $(dbus-launch --sh-syntax --exit-with-session)
export DBUS_SESSION_BUS_ADDRESS
export DISPLAY

exec startdwm

