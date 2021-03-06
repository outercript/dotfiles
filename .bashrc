# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
_settings_dir=~/.shellrc.d
if [ -d $_settings_dir ]; then
    for script in $_settings_dir/*.bash; do
        source "${script}"
    done
fi

export PATH=$PATH:~/bin
export EDITOR=vim
export MINICOM="-c on"
export LANG="en_US.UTF-8"

# Shell Options
# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
shopt -s cdspell

# Resize output to fit window
shopt -s checkwinsize

# History Options
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Longer history
export HISTFILESIZE=2000
export HISTIGNORE="&:[ ]*:exit"

# Aliases
alias vi="vim"
alias ll="ls -lh"
alias top="top -mM"
alias gdb="gdb -tui -q"

# File handling
alias ls='ls -hF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Default to human readable figure
alias df='df -h'
alias du='du -h'
