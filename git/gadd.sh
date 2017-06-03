# @name gadd
# @package tools
# @subpackage git
# @author Ralph Dittrich <LupusCoding@gmail.com>
#

# usage:
# add all changes: 		$ gadd
# add specific change: 	$ gadd /path/to/file
gadd() {
    if [ $# -ne 0 ]; then
        case $1 in
            --help|-h)
                echo "usage: gadd [filename]"
                ;;
            *)
                # add file
                command git add $@
                ;;
        esac
    else
        # add all files
        command git add --all
        # get list of tracked files
        GSTATUS=$(git status -s)
        if [ "${GSTATUS}" != "" ]; then
            # change codes to values and get colors
            GSTATUS="${GSTATUS// A /\\033[1;31m- \\033[0;32mAdded      }"  # Added Files (added files not added for commit)
            GSTATUS="${GSTATUS//AM /\\033[1;31m! \\033[0;32mAdded       }" # Added Files(modified after git add)
            GSTATUS="${GSTATUS//A /\\033[0;32m+ \\033[0;32mAdded      }"   # Added Files
            GSTATUS="${GSTATUS// M /\\033[1;31m- \\033[1;33mModified   }"  # Modified Files (modified files not added for commit)
            GSTATUS="${GSTATUS//MM /\\033[1;31m! \\033[1;33mModified    }" # Modified Files (modified after git add)
            GSTATUS="${GSTATUS//M /\\033[0;32m+ \\033[1;33mModified   }"   # Modified Files
            GSTATUS="${GSTATUS// D /\\033[1;31m- \033[1;31mDeleted    }"  # Deleted Files (deleted files not added for commit)
            GSTATUS="${GSTATUS//D /\\033[0;32m+ \\033[1;31mDeleted    }"   # Deleted Files
            GSTATUS="${GSTATUS//\?\? /\\033[0;37mUntracked   }"           # Untracked Files
        else
            GSTATUS="\033[1;33mnothing to show\033[0m"
        fi
        # output list of Files
        echo -e "${GSTATUS}\033[0m"
    fi
}