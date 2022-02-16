[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

alias l='ls -CFA --color=auto'
alias ,='clear'
alias q='exit'
alias ..='cd ..'
alias v='vim'
alias vb='vim ~/.bashrc'
alias bad='cd ~/bad-apple/ && python3 touhou_bad_apple_v4.0.py'
alias rsclock='~/rsClock/target/release/rsclock'
alias sl='sl | lolcat'
alias wsl='while :; do sl ; done'
alias awe='vim ~/.config/awesome/rc.lua'
alias vk='v ~/.config/kitty/kitty.conf'
alias fu='emerge --ask --verbose --update --deep --newuse @world'
alias es='emerge -s'
alias zxc='doas pacman -Syu'
alias s='sudo pacman -S'
alias ss='sudo pacman -Ss'


shopt -s autocd

PS1='\[\033[032m\][ \w ]\n\[\033[31m\]>:|\[\033[97m\]'

complete -cf doas
# . "$HOME/.cargo/env"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im-ibus
export QT_IM_MODULE=ibus

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
