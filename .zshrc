# Exec 
# > zplug install
# > zplug load
# to enable zplug plugins.

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/seisyu/.zshrc'

[[ -s `/usr/local/bin/brew --prefix`/etc/autojump.zsh ]] && . `/usr/local/bin/brew --prefix`/etc/autojump.zsh

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall


export LSCOLORS=gxfxcxdxbxegedabagacad

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
eval `/usr/local/bin/gdircolors ~/.dir_colors -b`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#export PS1='%n@%m[%~] %D %*
#%# '
nprom () {
    setopt prompt_subst
    local rbase=$'%{\e[33m%}[%~]%{\e[m%}' lf=$'\n'
    local pct=$'%0(?||%18(?||%{\e[31m%}))%{\e[m%}'
    RPROMPT="%1(v|%F{blue}%1v%f|)"
#    RPROMPT="%9(~||$rbase)"
    case "$USER" in
      yatex)	PROMPT=$'%{\e[33m%}%U%n@%m%%%{\e[m%}%u ' ;;
      java)	PROMPT=$'%{\e[36m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      *)
    local pbase=$'%{\e[$[32+RANDOM%5]m%}%U%B%n@%m%b'"$pct%u %D %* "
    PROMPT="$pbase $rbase
%# "
    ;;
    esac
#    [[ "$TERM" = "screen" ]] && RPROMPT="[%U%~%u]"
}
nprom

export PAGER="lv -c"
export EDITOR=emacsclient

umask 022
stty -ixon

setopt ignoreeof
setopt autocd
setopt no_clobber
setopt AUTO_PUSHD
setopt correct
#setopt correct_all
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_ignore_space
setopt extended_glob
setopt list_rows_first
setopt auto_name_dirs
setopt cdable_vars
setopt auto_pushd
setopt pushd_ignore_dups

#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end
#bindkey "^p" history-beginning-search-backward
#bindkey "^n" history-beginning-search-forward

autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Watch Dog
watch=(all)


alias ls='ls -FG'
alias ll='ls -l'
alias la='ll -a'
alias l='ll -h'
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
alias fcd='source ~/bin/fcd.sh'
alias lsusb='system_profiler SPUSBDataType'


export FLEX_HOME=/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec
export AIR_HOME=/usr/local/Cellar/adobe-air-sdk/3.1

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/games:.

# Haskell cabal
PATH=~/.cabal/bin:$PATH

# Nodebrew
PATH=~/.nodebrew/current/bin:$PATH

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

#export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export CLASSPATH=/usr/share/java/jakarta-poi.jar:/usr/share/java/jakarta-poi-scratchpad.jar:/usr/share/java/jakarta-poi-contrib.jar:/usr/share/java/commons-logging.jar:/usr/share/java/log4j-1.2.jar:/usr/share/java/xalan2.jar:/usr/share/java/swank-clojure.jar
#ANDROID_SDK_ROOT=$HOME/opt/android-sdk-linux_x86

PATH=$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:/usr/local/gnu/bin:"${PATH}"
PATH=~/job/ZDC/bin:$PATH

export PATH
#export RUBYOPT="-Ke"

# ssh-agent and screen
#if [ "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/auth_sock" ]; then
#	ln -fs $SSH_AUTH_SOCK $HOME/.ssh/auth_sock
#	export SSH_AUTH_SOCK=$HOME/.ssh/auth_sock
#fi
#
#ssh-agent-screen () {
#	ssh-agent sh -c 'ln -sf $SSH_AUTH_SOCK $HOME/.ssh/auth_sock && screen -r -U || screen -U'
#}

# To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

#To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export HOMEBREW_GITHUB_API_TOKEN=9f07b1759addb2100f62f1ff2aa3c31942421068

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
#zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:19

zplug load

# anyframe
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^r' anyframe-widget-put-history
bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename

# enhancd
#export ENHANCD_FILTER=peco

# zsh-history-substring-search 
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

