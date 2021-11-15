#! /usr/bin/env bash

#note: look at 'jq', the cli JSON parser (man jq), for assistance parsing the json structure I've created for storing and querying data about each split / SG_drawer. 

#USAGE: 
#      splitgit DRWR                                                  ~ create a new git repository with DRWR as base directory
#      splitgit all                                                   ~ same as running an instance of `splitgit DRWR` for every SG_drawer
#      splitgit (-d|--SG_drawer) DRWR                                    ~ create a new git repository with DRWR as base directory
#      splitgit (-d|--SG_drawer) DRWR (-p|--message-prefix) PRFX         ~ create a new git repository with DRWR as base directory and PRFX used as a prefix for any commits 
#
#      Anywhere DRWR is listed above, it can be replaced with 'all' as in the second version.
#

source {../dev-tool-box/support-drwr-utility-belt/SOURCE/liberrors-sh/*\.sh}
echo "${0}: Result of attempt to import error handling was: " | tee -a liblog.log
echo "${0}: ${?}" | tee -a liblog.log
echo "${0}: If result was not 0, then script is broken." | tee -a liblog.log

SG_PARENT={}
SG_DRAWER=-1
SG_PREFIX=-1


# this needs changed. For now, it only supports usages 2 & 3. needs to be fed through an argparser.

if [ "${1}" = "-d" ] || [ "${1}" = "--SG_drawer" ]; then
	SG_DRAWER="${2}"
	if [ "${3}" = "-p" ] || [ "${3}" = "--message-prefix" ]; then
		SG_PREFIX="${4}"
	fi
elif [ "${1}" = "-p" ] || [ "${1}" = "--message-prefix" ]; then
	if [ "${3}" = "-d" ] || [ "${3}" = "--SG_drawer" ]; then
		SG_PREFIX="${2}"
		SG_DRAWER="${4}"
	fi
elif [ -f "${1}" ]; then
	SG_DRAWER="${1}"
else
	throw_fatal_error 160
fi

# git subtree split -P 'dev-tool-box/support-drwr-utility-belt' --annotate='@PARENT_' -b 'split__01' HEAD@{0}

if [ "${SG_DRAWER}" = 'all' ]; then
	SG_splitall
else
	SG_splitone "${SG_DRAWER}"
fi


mklist_local_drwrs () {
	true
}

mklist_remote_drwrs () {
	true
}