source /usr/local/nde/setup/nderc.csh
# Custom PATH
set path = ($HOME/.local/bin $path)

# Source all user scripts under the cshrc.d dir
if ( -d ~/.cshrc.d ) then
  foreach file ( ~/.cshrc.d/*.csh )
    source $file
  end
endif

# Enable TAB completion mechanism
set filec
set nobeep
set autolist
set autocorrect

# History
set histdup = 'prev'    # Do not add duplicates, keeps older ones
set history = 1000      # Save up to X lines to history file

# Color rainbows
set color
set colorcat

# Custom stuff
setenv EDITOR vim

# Files that are to be ignored from completion.
set fignore=(.o .bak .pyc .class)

# Aliases
alias vi vim
alias top top -mM
