#!/bin/bash
#
# @name gitinit
# @package tools
# @subpackage git
# @author Ralph Dittrich <LupusCoding@gmail.com>
#

# initialize git repo for either
# flow, lab, full or standardized
gitinit() {
    if [ $# -ne 0 ]; then
        echo "usage: gitcp COMMIT_MSG"
    else
    	case $1 in
            flow)
                # simple git flow init
                command git flow init -d
                ;;
            lab)
                # init for github / gitlab
                command git init
                command touch README.md
                command git add --all
                command git commit -m "initial commit"
                command git log
                ;;
            full)
                # full init with flow
                command git init
                command touch README.md
                command git add --all
                command git flow init -d
                command git log
                ;;
            ''|*)
                command git init ${@:2}
                ;;
        esac
    fi
}