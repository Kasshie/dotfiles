#!/bin/bash

declare -a options=(
	"ca"
	"us"
	)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Keyboard Layout' )

if [[ "$choice" == ca ]]; then
    setxkbmap -layout ca
elif [[ "$choice" == us ]]; then
    setxkbmap -layout us
else
    exit 1
fi


