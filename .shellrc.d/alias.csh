# Make firefox from the prompt more usefull
alias firefox 'firefox \!* >& /dev/null &'
alias x       'xemacs  \!* >& /dev/null &'

alias lsgrep  'grep -l \!* | xargs -r ls -ltr'
alias fix_gnome_paste 'printf "\e[?2004l"'
