# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

export DOTPROFILE=1

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Paths for ports
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=/usr/bin/vim

# Path for mysql
export PATH=$PATH:/usr/local/mysql/bin

# Path for my binaries
export PATH=~/bin:$PATH

# Setting PATH for MacPython 2.5
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH
source ~/ruby_switcher.sh
# vi:filetype=sh:
