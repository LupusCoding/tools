#!/bin/bash
#
# @name gittree
# @package tools
# @subpackage git
# @author Ralph Dittrich <LupusCoding@gmail.com>
#

# simple shortcut to show commit tree
gittree() {
	command git log --graph --oneline --all
}