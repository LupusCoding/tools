#!/bin/bash
#
# @name gitcp
# @package tools
# @subpackage git
# @author Ralph Dittrich <LupusCoding@gmail.com>
#

# shortcut to commit and push directly
gitcp() {
    if [ $# -ne 0 ]; then
        echo "usage: gitcp COMMIT_MSG"
    else
        COMMIT_MSG="${@:2}"
        echo "git commit -m ${COMMIT_MSG}"
        command git commit -m "${COMMIT_MSG}"
        command git push
	fi
}