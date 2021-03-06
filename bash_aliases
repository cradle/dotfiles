# Some useful aliases
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'

#######
# git #
#######
alias g='git'
alias ga="git add"
alias gb='git branch --verbose'
alias gba='git branch --verbose -a'
alias gc='git commit --verbose'
alias gci='git commit --verbose'
alias gca='git commit --verbose --all'
alias gco="git checkout"
alias gd='git diff --ignore-space-change'
alias gk='gitk &'
alias gx='gitx .'
if [ "$system_name" == 'Darwin' ]; then
  alias gd='git diff --ignore-space-change | gitx'
else
  alias gd='git diff --ignore-space-change'
fi
alias gk='gitk --all &'
alias gl='git pull'
alias gm="git merge"
alias gnp='git --no-pager'
alias gp='git push'
alias gs="git stash"
alias gsu="git submodule update --init"
alias gst="git st"
alias gst='git status'

alias gitrm="git stat | grep deleted | awk '{print $3}' | xargs git rm"

function gsearch {
  for branch in `git branch | sed 's/\*//'`; do echo $branch:; git ls-tree -r --name-only $branch | grep "$1"; done
}

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status
  fi
}

#######
# SVN #
#######
alias sup='svn up' # trust me 3 chars makes a difference
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

########
# RUBY #
########
# use readline, completion and require rubygems by default for irb
alias irb='irb --simple-prompt -r irb/completion'
alias rd='rdebug --no-stop'

export GEMDIR=`gem env gemdir`
# use: cdgem <gem name>, cd's into your gems directory and opens gem that best
# matches the gem name provided
function cdgem {
  cd $GEMDIR/gems
  cd `ls | grep $1 | sort | tail -1`
}
_cdgemcomplete() {
  COMPREPLY=($(compgen -W '$(ls $GEMDIR/gems)' -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _cdgemcomplete cdgem

# use: gemdoc <gem name>, opens gem docs from the gem docs directory that best
# matches the gem name provided
# (hat tip: http://stephencelis.com/archive/2008/6/bashfully-yours-gem-shortcuts)
gemdoc() {
  open -a firefox $GEMDIR/doc/`ls $GEMDIR/doc | grep $1 | sort | tail -1`/rdoc/index.html
}
_gemdocomplete() {
  COMPREPLY=($(compgen -W '$(ls $GEMDIR/doc)' -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F _gemdocomplete gemdoc

# use: vimgem <gem name>, cd's into your gems directory and opens gem that best
# matches the gem name provided in gvim
function vimgem {
  gvim -c NERDTree $GEMDIR/gems/`ls $GEMDIR/gems | grep $1 | sort | tail -1`
}
complete -o default -o nospace -F _cdgemcomplete vimgem


#########
# RAILS #
#########
alias ss='script/server' # start up the beast
alias sr='kill -USR2 `cat tmp/pids/mongrel.pid`' # restart detached Mongrel
alias sst='kill `cat tmp/pids/mongrel.pid`' # restart detached Mongrel
alias sc='script/console'
alias a='autospec' # makes autotesting even quicker

#############
# PASSENGER #
#############
# Use this in any RAILS_ROOT dir. That restart.txt file tells mod_rails to restart this app.
# You'll want to do this when (for example) you install a new plugin.
alias passenger-restart='touch tmp/restart.txt'

# You'll be adding to your vhosts configuration everytime you introduce a new Rails app.
# Might as well make it a shortcut
alias passenger-host='sudo gvim -p ~/apache2/vhosts.conf /etc/hosts > /dev/null'

# You'll need to restart apache whenever you make a change to vhosts.
# You can also click System Preference->Sharing->Web Sharing, but this is quicker.
alias graceful='sudo apachectl graceful'


########
# misc #
########
alias h='history'
alias j="jobs -l"
alias l="ls -lah"
alias ls='ls -h --color=auto'
alias ll="ls -lh --color=auto"
alias la='ls -ah --color=auto'
alias lla='ls -alh --color=auto'
alias svnst="svn st | grep -v '^\?'"
alias which='which -a'
alias cleanvimswaps="find . | grep \.sw[po]$ | xargs rm"
alias pwsafe='pwsafe -E'
alias gconsync='/System/Library/PrivateFrameworks/GoogleContactSync.framework/Versions/A/Resources/gconsync --sync com.google.ContactSync --syncmode slow --report 1'
alias ..='cd ..;' # can then do .. .. .. to move up multiple directories.
alias ...='.. ..'
alias ....='.. .. ..'
alias cdp='cd ~/Desktop/projects'

# vi:filetype=sh
