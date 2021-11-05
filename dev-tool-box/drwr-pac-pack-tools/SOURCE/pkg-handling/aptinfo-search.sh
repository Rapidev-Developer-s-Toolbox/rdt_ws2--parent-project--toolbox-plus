#! /usr/bin/bash

PROG_NAME="${0}"
PROG_VERS="0.0.1"
# Moves to 0 if -h is the sole 
HELP=1
GREP_FILTER=([type]=none, [value]=-1)
CURRENT=$(pwd)
OUTPUT="${CURRENT}/aptlist.out"

printusage () {
  printf '\*\* %s \*\*\n\n',"${PROG_NAME}" 
  printf '  Searches for packages related to KEYWORD with apt (or snap), and retrieves dpkg info for result set.\n\n'
  printf '  Synopsis:\n\n  infosearch [options] KEYWORD'
  printf '  Usage:\n\n'
  printf '    -h | --help\n    Print Usage (but you know that.)\n'
  printf '    -v | --verbose\n    Print extra info to the console during \n'
  printf '    -V | --version\n    Print version\n'
  printf '    -t | --h <TYPE>\n   Choose between Apt, Snap, or both as the backend search tools. More types coming soon.\n\n'
  printf '    -h | --help\n    Ppint Usage (but you know that.)\n'
  printf '    -v | --verbose\n    Print extra info to the console during \n'
  printf '    -V | --version\n    Print version\n'
  printf '    -t | --h <TYPE>\n   Choose between Apt, Snap, or both as the backend search'
  exit 0
}

  ##########################################################
 #                                                          #
#   TODO:refactor so that the function takes in a list of   #
#  search-phrases, in order to support globs and regex      #
#                                                          #
 ##########################################################

getoptions () {
  while [ "$1" != '' ]; do
    case "${1}" in
    # prints Usage
      -h|--help) 
        HELP=0 && shift
      ;;
      -v|--verbose)
        CHATTY=0
      ;;
      -t|--type)

      ;;
    # Takes an extra argument- used as an extra filter > search, then grep, then info.
      -g|--grep-result) 
        if [ "${2}" != '-.*' ] && [ "${3}" ]; then
          if [ GREP_FILTER[type]='pre' && GREP_FILTER[value]="${2}" && shift && shift ]; then
            continue
          else
            handleerror 1 internalerror
        elif [ "${2}" = '-.*' ]; then
          handleerror
        fi
      ;;
      -n|--grep-names-only) 
        echo 'needs implementation.' && shift
      ;;      
      -o|--output) 
        [ "${2}" != '-.*' ] && OUTPUT="${2}" && shift && shift 
      ;;
      -k|--keyword) 
        echo 'needs implementation.' && shift
      ;;

      *) 
        echo "Unknown parameter: ${1}" && shift
      ;;
    esac
  done
}

if [ "${HELP}" -eq 0 ]; then
    printusage
fi


rand1="$(head -c 16 /dev/urandom)"
file="searchres${rand1}"

touch "${file}"

if [ -z "${3}" ]; then
  apt search "${1}" | grep '.*/focal.*' | grep "${GREP_FILTER}" >> "${file}"
elif [ -z "${2}" ]; then
  apt search "${1}" >> "${file}"
fi

if [ -f "${file}" ]; then
  sed 's/\/focal.*//' "${file}"
fi