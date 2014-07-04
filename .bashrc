# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
_settings_dir=~/.bashrc.d
if [ -d $_settings_dir ]; then
    for script in $_settings_dir/*.bash; do
        source "${script}"
    done
fi

export PATH=$PATH:~/bin
export EDITOR=vim

# History preferences
export HISTFILESIZE=2000
export HISTIGNORE="&:[ ]*:exit"

# Aliases
alias ll="ls -lh"
export MINICOM="-c on"
