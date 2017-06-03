#!/bin/bash
#
# @name clipdiff
# @package tools
# @author Ralph Dittrich <LupusCoding@gmail.com
#

# diff between file and clipboard
clipdiff() {
    if [ $# -eq 0 ]; then
        echo "usage: clipdiff FILE"
        echo ""
        echo "diff between FILE and your clipboard"
    else
        if [ -f "/dev/clip" ]; then
            echo /dev/clip > /tmp/clpd
        elif [ -f "/dev/clipboard" ]; then
            echo /dev/clipboard > /tmp/clpd
        else
            echo "can not get clipboard contents"
            exit 1
        fi
        diff $1 /tmp/clpd
    fi
}
