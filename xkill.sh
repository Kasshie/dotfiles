#!/bin/bash

declare -a options=(
	"Xkill"
	"Kill animwall"
	"animwall"
	"nitrogen --restore"
	"Close"
	)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Xkill' )

if [[ "$choice" == Xkill ]]; then
    xkill
elif [[ "$choice" == "Kill animwall" ]]; then
    killall animwall
elif [[ "$choice" == animwall ]]; then
    animwall
elif [[ "$choice" == "nitrogen --restore" ]]; then
    nitrogen --restore
elif [[ "$choice" == Close ]]; then
    exit 1
fi
 


