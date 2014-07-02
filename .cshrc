source /usr/local/nde/setup/nderc.csh

# Enable TAB completion mechanism
set filec
set autolist
set nobeep

# Fix typos
set autocorrect

# Color rainbows
set color
set colorcat

# Custom stuff
setenv EDITOR vim

# Check for a color capable terminal
if (-e "/usr/share/terminfo/x/xterm-256color") then
  setenv TERM xterm-256color
endif

# Files that are to be ignored from completion.
set fignore=(.o)

alias top top -mM

# Custom Colors for Prompt
set    c_red="%{\e[31;40;1m%}"
set  c_green="%{\e[32;40;1m%}"
set c_yellow="%{\e[33;40;1m%}"
set   c_cyan="%{\e[36;40;1m%}"
set  c_white="%{\e[37;40;1m%}"
set  c_reset="%{\e[0m%}"

# Custom Prompt
if ($?ADE_VIEW_NAME) then
    set prompt="[${c_cyan}${ADE_VIEW_NAME}${c_reset}> %c]%# "
else
    set prompt="${c_yellow}[%n@%m %c]${c_reset}%# "
endif
