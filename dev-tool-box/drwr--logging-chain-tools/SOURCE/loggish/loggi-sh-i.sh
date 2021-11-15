#! /usr/bin/env bash

# usage: make_log NAME PARENT   --->> 
#           #1# Ideally, outputs a log file 'NAME.log' in PARENT. #2# If 'NAME.log' already exists, 
#           then the original is moved to 'NAME.1.log'. #3# During this process, all files in the PARENT 
#           directory (taken as the value of PARENT in the command. If PARENT is not passed, it is set to 
#           $PWD.) of type 'NAME.N.log' are renamed to 'NAME.N+1.log', starting with the match with the 
#           highest value of N and working downward. Gaps in the N values will remain, but they will be 
#           shifted upward with everything else. For example, if the directory before make_log is run, 
#           has 'NAME.1.log', 'NAME.2.log', and 'NAME.4.log', after running make_log, it will have 
#           'NAME.1.log', 'NAME.2.log', and 'NAME.3.log', and 'NAME.5.log'. make_log returns 0 on success, 
#           and uses 'throw_recoverable_error' and 'throw_fatal_error' to define the error code in all other 
#           situations.

make_log () {
  local START_DIR="${PWD}"
  # local LOGNUM=''
  LOGGERPATH_PARENT="${2}"
  # LOGGERPATH_PREFIX="${LOGGERPATH_PARENT}/${1}"
  # LOGGERPATH_FULLNAME="${LOGGERPATH_PREFIX}\.${LOGNUM}\.log"

  # parse filenames in ${LOGGERPATH_PARENT} & determine the oldest

  # local oldest=-1
  logs_in_PARENT=()
  # local logs_in_order=()

  # find "${LOGGERPATH_PARENT}" -type f -name '*\.log' | parallel echo -e {} |tee ${LOGGERPATH_FULLNAME}|\
  # tr -d "${LOGGERPATH_PREFIX}" | tr -d '\.log' 

  

  for d in "${LOGGERPATH_PARENT}/"*
  do
    if [[ "${d}" =~ [.*\.log] ]]
    then
      if [ -f "${d}" ]
      then
  #     sed 's/.*\.log//' "${d}" | tr "${LOGGERPATH_PARENT}/${2}" '' >&1 dirnum
        logs_in_PARENT+=( "${d}" )
      fi
    fi
  done
  echo "${logs_in_PARENT[@]}"
  return 0
}


# Set up the windows in a Sway workspace into Vim IDE formation #1
function tellmehi {
    echo "Hey there Nathan. Get your ass up & get ready!"
}

function mktool {
    . "$MYRAP3/librapidev-dev/librapi-dev.sh"
    echo 'rpdv-mktool $1'
}


