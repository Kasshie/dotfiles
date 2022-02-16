#!/bin/bash

declare -a options=(
	"Close"
	"Minecraft"
	"CS:GO"
	"Brawlhalla"
	"Steam"
	)
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Game')

if [[ "$choice" == Close ]]; then
    exit 1
elif [ "$choice" == 'Minecraft' ]; then
    minecraft-launcher
elif [ "$choice" == 'CS:GO' ]; then
    steam steam://rungameid/730
elif [ "$choice" == 'Steam' ]; then
    steam
elif [ "$choice" == 'Brawlhalla' ]; then
    steam steam://rungameid/291550
fi




