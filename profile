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
