# Custom PATH
set path = ($HOME/bin $HOME/.local/bin $path)
setenv _shellrc  "$HOME/.shellrc.d"
setenv _localrc  "$HOME/.localrc.d"

# Source all common scripts
if ( -d "$_shellrc" ) then
  foreach file ( $_shellrc/*.csh )
    source $file
  end
endif

# Source all host specific scripts
if ( -d "$_localrc" ) then
  foreach file ( $_localrc/*.csh )
    source $file
  end
endif


# Enable TAB completion mechanism
set filec
set nobeep
set autolist
set autocorrect
set autolist = ambiguous      # List only showed on autocomplete fails
set complete = Enhance        # Case in-sensitive complete

# Commands options
set notify
set pushdtohome               # Pushd go $HOME if no args
set pushdsilent               # Pushd no verbose
set autorehash                # Recompute hash if a cmd is not in path

# History
set histdup = 'prev'          # Do not add duplicates, keeps older ones
set history = 2000            # Save up to X lines to history file
set savehist = (2000 merge)   # Do not replace existin history file

# Color rainbows
set color
set colorcat

# Custom stuff
setenv EDITOR   vim
setenv MINICOM  '-c on'

# Files that are to be ignored from completion.
set fignore=(.o .bak .pyc .class)

# Aliases
alias vi vim
alias top top -mM
alias gdb gdb -tui -q

# File handling
alias ls ls -hF --color=auto
alias ll ls -lha --color=auto
alias grep grep --color=auto
alias egrep egrep --color=auto
alias fgrep fgrep --color=auto

# Default to human readable figure
alias df df -h
alias du du -h
