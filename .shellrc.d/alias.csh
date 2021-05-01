# Make firefox from the prompt more usefull
alias firefox 'firefox \!* >& /dev/null &'
alias x       'xemacs  \!* >& /dev/null &'

alias lsgrep  'grep -l \!* | xargs -r ls -ltr'
alias fix_gnome_paste 'printf "\e[?2004l"'

alias vnc_resize 'xrandr -s 1920x1080'
alias set_title 'echo -ne "\033]0; \!* \007"'

