#!/bin/bash
#
# SVG convert script
# 
# @author 		Ralph dittrich <LupusCoding@gmail.com>
# @description 	Convert an IconFont SVG to photoshop/gimp readable file
# @version 		0.1.0

# global vars
DEBUG=0		# Get debug output 0=no 1=yes
INFILE=''	# Path for input file - given as parameter
OUTFILE=''	# Path for output file - given as parameter

# convert function
#
# needs filled vars:
# - INFILE
# - OUTFILE
function convert
{
	local line tmpline
	while read line; do
		tmpline="${line}"
		tmpline="${tmpline/glyph unicode\=/path id=}"
		tmpline="${tmpline/ d\=/ fill-rule=\"evenodd\" d=}"
		tmpline="${tmpline/\"\&\#/\"}"
		tmpline="${tmpline/\;\"/\"}"
		if [ $DEBUG -eq 1 ]; then
			echo "DEBUG: $tmpline"
		fi
		echo "${tmpline}" >> "${OUTFILE}"
	done < $INFILE
	# last SVG line is not readable by script but always the same content
	echo "</font></defs></svg>" >> "${OUTFILE}"
	return 0
}

# check if files exist
#
# needs filled vars:
# - INFILE
# - OUTFILE
function checkfiles
{
	if [ ! -f $INFILE ]; then
		echo "ERROR: File ${INFILE} does not exist"
		return 1
	fi
	if [ ! -f $OUTFILE ]; then
		command touch $OUTFILE
		return 0
	else
		echo "ERROR: File ${OUTFILE} already exist"
		return 1
	fi
}

# show usage
function usage
{
	echo "usage: ./svg_convert.sh {INPUT FILE} {OUTPUT FILE}"
	echo "       {INPUT FILE} must exist"
	echo "       {OUTPUT FILE} must not exist"
}

# main function
function main
{
	# get parameter
	INFILE="$1"
	OUTFILE="$2"
	if [ "${INFILE}" == '' ]; then
		echo "Parameter missing: input file path"
		return 1
	fi
	if [ "${OUTFILE}" == '' ]; then
		echo "Parameter missing: output file path"
		return 1
	fi
	echo "Input File:  $INFILE"
	echo "Output File: $OUTFILE"

	# check if files exist
	checkfiles
	if [ $? -eq 1 ]; then
		return 1
	fi

	# convert
	echo "Starting convert"
	convert
	if [ ! $? -eq 1 ]; then
		echo "Finished convertation successful"
		echo ""
		echo "open ${OUTFILE} with photoshop / gimp and active \"import paths\""
		return 0
	fi
}

main $@