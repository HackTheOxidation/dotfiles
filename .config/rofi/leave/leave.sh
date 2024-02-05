#!/usr/bin/env bash

wallpaper=/usr/share/backgrounds/personal/stairs.jpg

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu)
if [[ $choice == "Lock" ]];then
    swaylock --image $wallpaper
elif [[ $choice == "Logout" ]];then
    pkill -KILL -u "$USER"
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
fi
