#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start xorg on startup(just after login)
[[ $(fgconsole 2> /dev/null) ]] && exec startx -- vt1

# xmodmap
[[ $(fgconsole 2> /dev/null) ]] && exec xmodmap ~/.Xmodmap
