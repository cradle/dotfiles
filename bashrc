# ~/.bashrc: executed by bash(1) for non-login shells.

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

export GREP_OPTIONS="--color=auto"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if [ -f /opt/local/etc/bash_completion ]; then
#   . /opt/local/etc/bash_completion
# fi

[ -z $DISPLAY ] && export DISPLAY=:0
[ -z $EDITOR ] && export EDITOR=vim

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm-color)
    PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$ '
    ;;
*)
  ;;
esac

# completion
complete -C ~/.utils/completion_rake.rb -o default rake
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
  yellow="\[\e[0;33m\]"
  green="\[\e[0;32m\]"
  red="\[\e[0;31m\]"
  blue="\[\e[0;34m\]"
  fgcolor="\[\e[0m\]"
  #export PS1="${yellow}\h${fgcolor}:${green}\W${red}\$(__git_ps1)${fgcolor}\$ "
  export PS1="${yellow}\h${fgcolor}:${blue}\w${fgcolor} ${green}\u${fgcolor}\$(__git_ps1 \" (%s)\")$ "
  unset yellow green red blue fgcolor
  ;;
  *)
  PS1='\h:\w \u\$ '
  ;;
esac
