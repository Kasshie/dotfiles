#
# ~/.bash_profile
#

export SDL_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export GTK_IM_MODULE='fcitx'
export XMODIFIERS='@im-fcitx'

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2> /dev/null) ]] && exec xmodmap ~/.Xmodmap


. "$HOME/.cargo/env"
