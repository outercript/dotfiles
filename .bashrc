# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

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
export MINICOM="-c on"

# Shell Options
# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
shopt -s cdspell


# History Options
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Longer history
export HISTFILESIZE=2000
export HISTIGNORE="&:[ ]*:exit"

# Aliases
alias vi="vim"

# File handling
alias ls='ls -hF --color=auto'
alias ll="ls -lh"
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Default to human readable figure
alias df='df -h'
alias du='du -h'
