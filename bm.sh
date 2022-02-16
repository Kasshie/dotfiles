#!/bin/bash

BROWSER="qutebrowser"

declare -a options=(
	"quit"
	"youtube.com"
	"nhentai.net"
	"reddit.com"
	"reddit.com/r/linuxmemes/"
	"reddit.com/r/ProgrammerHumor/"
	"reddit.com/r/hentai/"
	"reddit.com/r/unixporn"
	"github.com"
	"songsterr.com/a/wsa/yiruma-shunga-jung-fingerstyle-river-flows-in-you-yiruma-shunga-jung-tab-s435174"
	"songsterr.com/a/wsa/takaya-kuroda-bakamitai-tab-s496995t0"
	"songsterr.com/a/wsa/johann-pachelbel-canon-in-d-solo-guitar-tab-s436761"
	"songsterr.com/a/wsa/tokyo-ghoul-op-unravel-tokyo-ghoul-op-unravel-tab-s392617"
	"songsterr.com/a/wsa/ludwig-van-beethoven-ode-to-joy-acoustic-arp-version-tab-s91848"
	)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'bookmarks')

if [[ "$choice" == quit ]]; then
    exit 1
elif [ "$choice" == 'youtube.com' ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    firefox "$cfg"
elif [ "$choice" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    $BROWSER "$cfg"
else
    exit 1
fi





