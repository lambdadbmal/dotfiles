# the default umask is set in /etc/login.defs
#umask 022

# the rest of this file is commented out.

# set variable identifying the chroot you work in
#if [ -f /etc/debian_chroot ]; then
#  debian_chroot=$(cat /etc/debian_chroot)
#fi

# include .zshrc if it exists
if [ -f ~/.zshrc ]; then
    if [ -z "$ZSHRC_DONE" ]; then
        . ~/.zshrc;
        export ZSHRC_DONE="DONE"
    fi
fi

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin/:/usr/games/:/bin:/sbin:./

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
#if [ -d ~/man ]; then
#    MANPATH=~/man:"${MANPATH}"
#    export MANPATH
#fi

export MANPATH=$MANPATH:"$HOME/Library/Application Support/Dash/Man Pages/Linux"

del () {
    command mv $* ~/.Trash/
}

# source-highlight
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

function lvc() { if [ -f $1 ]; then less $1 | lv -c; fi;  }


PATH=/usr/local/bin:"${PATH}"
PATH=~/job/ZDC/bin:"${PATH}"

export PATH
export PERSONAL_CONFIG="${HOME}/data/seisyu"

# MacPorts Installer addition on 2009-12-19_at_01:18:35: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export DISPLAY=:0.0
export EDITOR=/usr/bin/vim
#export JAVA_HOME=/Library/Java/Home
export JAVA_HOME=`/usr/libexec/java_home`
#export CLASSPATH="${HOME}/opt/swank-clojure/swank-clojure.jar"
export ANDROID_HOME=/usr/local/opt/android-sdk

#if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

#alias emacs="open -a Emacs"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
alias fcd='source ~/bin/fcd.sh'
alias lsusb='system_profiler SPUSBDataType'

