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
