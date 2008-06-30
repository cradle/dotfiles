# set PATH so it includes ports
# set MANPATH so it includes ports
export MANPATH=/opt/local/share/man:"${MANPATH}"

# set PATH so it includes user's private bin if it exists

# remove duplicates from PATH
export PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if [ -f /opt/local/etc/bash_completion ]; then
#   . /opt/local/etc/bash_completion
# fi
complete -C ~/config/utilities/completion_rake.rb -o default rake
source ~/config/utilities/completion_git.sh

[ -z $DISPLAY ] && export DISPLAY=:0
[ -z $EDITOR ] && export EDITOR=vim

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$ '
    ;;
*)
    PS1='\h:\w \u\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
