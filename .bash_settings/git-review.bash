_git_review () {
    __git_complete_strategy && return;

    case "$cur" in
        -*)
        __gitcomp "-r -h"
        return
        ;;
    esac;
    __git_complete_file
}
