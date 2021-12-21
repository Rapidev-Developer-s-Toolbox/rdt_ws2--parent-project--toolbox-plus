#! /usr/bin/bash

# USAGE: mkdirectree -p|--parent FULL-PATH-OF-PARENT NAME-OF-TARGET
#        mkdirectree FULL-PATH-OF-TARGET               

# Set up environment variables for the runner shell
function init { true; }
# This is the dir inside of which the tree will be created, aka the parent directory, aka the base. Set with the 1st value arg. Should be $2, $1 should be '--parent' or '-p'. 

# TODO: write function to set PROJECT_TYPE to DEB,SBOOT,etc.


export PRJ_TYPE=-1
NEEDS_PARSED='Y'
PARENT=-1

source 


parseargs () 
{  
  for arg in "${@}"
  do
    if [ "${arg}" = "${0}" ] && [ "${NEEDS_PARSED}" = 'Y' ] 
    then
      continue
    elif [ "${NEEDS_PARSED}" = 'N' ]
    then
      NEEDS_PARSED='Y'
      continue
    else
      case "${arg}" in
        '-p'|'--parent')
          export PARENT="${arg+1}" && shift 2
          NEEDS_PARSED='N'
        ;;
        '-a'|'--all')
          export BUILD_ALL=0 && shift
        ;;
        *)
          if [ "${arg+1}" ]; then
            true
          fi
      esac
    fi
  done
}

# creates the BASE_DIRS array. Populates array with all directories that need populated.
calculate_bases_from_args () {
  
  if [ -z "${PARENT}" ]  
  then
    BASE_DIRS=''  
    echo "${BASE_DIRS}" # DEBUG ONLY -- COMMENT ME!!
  elif [ -d "${PARENT}" ]# if $PARENT set 
  then             
  # then count directory children. All children should be targets. If 0, error
    BASE_DIRS=()
    BASE_DIRS=("${PARENT}/*")
    echo "${BASE_DIRS[@]}" # DEBUG ONLY -- COMMENT ME!!
    BASE_COUNT="${#BASE_DIRS[@]}"
    MAX_INDEX="${BASE_COUNT}-1"
    for ndx in seq 0 "${MAX_INDEX}"
    do
      mksrcdirtree  "${BASE_DIRS[$ndx]}"
    done
  else
    true
  fi  
}



function mksrcdirtree {

   # for i in ./*
    for i in "${@}"
    do
        echo "Processing ${i} ..."
        if [ -d "$i" ]    
        then
            echo "Adding directories to ${i}."
            mkdir -p "$i"/MISC,RESOURCES,SOURCE/\{tools\},TARGET,TEST
            if [[ "${PRJ_TYPE}" = "debian" ]]
            then
                mkdir SOURCE/debian
            fi
            echo "All good!"
        else    
            errmsg="could not make directories!"
            printf "ERROR: %s" "${errmsg}"
            echo errmsg
            return 1
        fi
    done

}

function mkreadme {
    touch README.md
}

