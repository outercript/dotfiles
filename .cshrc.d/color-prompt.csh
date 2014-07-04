# Check for a color capable terminal
if (-e "/usr/share/terminfo/x/xterm-256color") then
  setenv TERM xterm-256color
endif

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
