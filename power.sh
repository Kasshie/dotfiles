#!/bin/bash

declare -a options=(
	"Cancel"
	"Logout"
	"Reboot"
	"Shutdown"
	)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Power menu')

if [[ "$choice" == Cancel ]]; then
    exit 1
elif [ "$choice" == Reboot ]; then
    doas reboot
elif [ "$choice" == Logout ]; then
    pkill -KILL -u kasshi 
elif [ "$choice" == Shutdown ]; then
    doas shutdown
else 
    exit 1
fi



