#!/bin/bash
#
# @name sudo
# @package tools
# @subpackage windows
# @author Ralph Dittrich <LupusCoding@gmail.com>
#

# You have to copy SUDO.cmd to c:\Windows\System32\
sudo() {
	cmd /c 'sudo cmd /k ""c:\Program Files\Git\git-bash.exe""'
}