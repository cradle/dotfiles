# ~/.bashrc: executed by bash(1) for non-login shells.

# set PATH so it includes ports
# set MANPATH so it includes ports
export PATH=$PATH:/opt/local/lib/postgresql82/bin
export MANPATH=/opt/local/share/man:"${MANPATH}"

# set PATH so it includes user's private bin if it exists
export PATH=$PATH:/opt/local/bin

# remove duplicates from PATH
export PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`

# Java Home (for ec2)
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with a space (good for sensitive info) in the history.
export HISTCONTROL=ignoredups:ignorespace

# share history between terms
shopt -s histappend
PROMPT_COMMAND='history -a'

export HISTSIZE=10000

export GREP_OPTIONS="--color=auto"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if [ -f /opt/local/etc/bash_completion ]; then
#   . /opt/local/etc/bash_completion
# fi

[ -z $DISPLAY ] && export DISPLAY=:0
[ -z $EDITOR ] && export EDITOR=vim

# completion
complete -C "ruby -r~/dotfiles/utils/completion_rake_cap.rb -e 'puts complete_tasks(:rake)'" -o default rake
function clear-completion-rake {
  rm ~/.raketabs-*
}
complete -C "ruby -r~/dotfiles/utils/completion_rake_cap.rb -e 'puts complete_tasks(:cap)'" -o default cap
function clear-completion-cap {
  rm ~/.captabs-*
}

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
  yellow="\[\e[0;33m\]"
  green="\[\e[0;32m\]"
  red="\[\e[0;31m\]"
  blue="\[\e[1;34m\]"
  fgcolor="\[\e[0m\]"
  #export PS1="${yellow}\h${fgcolor}:${green}\W${red}\$(__git_ps1)${fgcolor}\$ "
  export PS1="${blue}\w${fgcolor}\$(__git_ps1 \" (%s)\")$ "
  unset yellow green red blue fgcolor
  ;;
  *)
  PS1='\h:\w \u\$ '
  ;;
esac

SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initializing new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

. ~/dotfiles/utils/completion_git.sh
