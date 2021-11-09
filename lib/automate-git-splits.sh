#! /usr/bin/env bash

#USAGE: 
#      splitgit DRWR
#      splitgit (-d|--drawer) DRWR
#      splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX

source {../dev-tool-box/support-drwr-utility-belt/SOURCE/liberrors-sh/*\.sh}
echo "Result of attempt to import error handling was: " | -a liblog.log
echo "${?}" | -a liblog.log
echo 'If result was not 0, then script is broken.' | -a liblog.log

DRAWER=-1
PREFIX=-1


# this needs changed. For now, it only supports usages 2 & 3. needs to be fed through an argparser.
if [ "${1}" = "-d" ] || [ "${1}" = "--drawer" ]; then
	DRAWER="${2}"
	if [ "${3}" = "-p" ] || [ "${3}" = "--message-prefix" ]; then
		PREFIX="${4}"
	fi
elif [ "${1}" = "-p" ] || [ "${1}" = "--message-prefix" ]; then
	if [ "${3}" = "-d" ] || [ "${3}" = "--drawer" ]; then
		PREFIX="${2}"
		DRAWER="${4}"
	fi
elif [ -n "${1}" ]; then
	DRAWER="${1}"
else
	

fi

git subtree split -P 'dev-tool-box/support-drwr-utility-belt' --annotate='@PARENT_' -b 'split__01' HEAD@{0}