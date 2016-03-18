# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[1;33m\]'
    c_path='\[\e[0;33m\]'
    c_git_clean='\[\e[0;36m\]'
    c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "${c_path}\w${c_reset}"
        return 0
    fi

    git_repo=$(basename `git rev-parse --show-toplevel` | sed -e '#\n##g')
    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    git_cwd=$(pwd | sed -e "s#`git rev-parse --show-toplevel`##g")

    if git diff --quiet 2>/dev/null >&2; then
        git_color="$c_git_clean"
    else
        git_color="$c_git_dirty"
    fi

    echo -n "(${git_repo})${c_path}${git_cwd}${c_reset}"
    echo -n " [${git_color}${git_branch}${c_reset}]"
}

virtualenv_prompt(){
    [ -z "$VIRTUAL_ENV" ] && return 0
    virtualenv_name=$(basename "$VIRTUAL_ENV")
    echo -n "($virtualenv_name) "
}

# Thy holy prompt.


#PS1="$(virtualenv_prompt)${c_user}\u${c_reset} $(git_prompt)\$ "
PROMPT_COMMAND='PS1="$(virtualenv_prompt)${c_user}\u${c_reset} $(git_prompt)\$ "'
