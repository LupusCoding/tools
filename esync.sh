#!/bin/bash
#
# @name esync
# @package tools
# @author Ralph Dittrich <LupusCoding@gmail.com
#

params="--stats --progress --numeric-ids -axAhHSPc"

# usage:
# local sync 					=> $ esync /from/here /to/there
# remote sync 					=> $ esync --ssh user@server:/from/here /to/there
# remote sync (with ssh config) => $ esync --ssh -F /path/to/ssh/config /from/here /to/there
esync() {
    if [ $# -eq 0 ]; then
		echo "usage:"
		echo "local sync:"
		echo "  $ esync /from/here /to/there"
		echo "remote sync:"
		echo "  $ esync --ssh user@server:/from/here /to/there"
		echo "remote sync (with ssh config)"
		echo "  $ esync --ssh -F /path/to/ssh/config /from/here /to/there"
    else
    	if [ "$1" == "--ssh" ]; then
    		command rsync $params -e ssh ${@:2}
    	else
    		command rsync $params $@
    	fi
    fi
}