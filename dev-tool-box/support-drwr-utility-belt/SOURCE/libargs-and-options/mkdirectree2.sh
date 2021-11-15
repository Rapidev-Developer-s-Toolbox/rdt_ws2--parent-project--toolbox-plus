#! /usr/bin/env bash


# Set up environment variables for the runner shell
function init { true; }
# This is the dir inside of which the tree will be created, aka the
# parent directory, aka the base. Set with the 1st value arg. 
# Should be $2, $1 should be '--parent' or '-p'. 

# TODO: write function to set PROJECT_TYPE to DEB,SBOOT,etc.

if [[ "${1}" = '$(--parent' ]] | [[ "${1}" = "-p" ]];then
    if [[  ]]
    echo ''
    DT_BASE=$

ARG_TYPE=-1
ARG_SUBTYPE=-1
PROJECT_TYPE=-1
NEEDS_PARSED='Y'
PARENT=-1
# array of chars, each of which holds a value that 
# corresponds to the type of the arg w/ the same index.
# e.g. if ARGTYPES_ARRAY[1] equals 'S', then "${1}" is 
# a short option with arg(s).
# S, L,   
ARGTYPES_ARRAY=() 


parseargs () 
{
    
    for arg in "${@}"
    do
			if [ "${arg}" = "${0}" ] && [ NEEDS_PARSED = 'Y' ] 
      then
        continue
    	elif [ NEEDS_PARSED = 'N' ]; then
            true
        else
            case "${arg}" in
                '-p'|'--parent')
                    PARENT="${arg+1}"
                    NEEDS_PARSED='N'
                ;;
                '-a'|'--all')
                    BUILD_ALL=0
                ;;
                *)
                    if [ "${arg+1}" ]
            esac
        fi
    done
}


# as new proj. types are added as options, we will just add a function with naming conv.:
#           mksrcdirtree-XX_XX_XX 
# where XX_XX_XX is the type. Note the use of - and _
# if we have 'sister types' that are nearly alike, we will
# save space by combining into a single function, as below.
function mksrcdirtree-generic_or_debian {
  # for i in ./*
  for i in "${@}"
  do
    echo "Processing $i ..."
    if [ -d $i ]    
    then
      echo "Adding directories to $i."
      mkdir -p $i/{MISC,RESOURCES,SOURCE{tools},TARGET,TEST}
      if [[ PRJ_TYPE -eq debian ]];then
        mkdir {}
			fi
        printf 'All good! Added first-level directory structure created for a new %s project' "${PROJECT_TYPE}"
      else    
        errmsg=$([ -d $i ])
        echo "ERROR: couldn't make directories!"
        echo errmsg
        return 1
      fi
    done


    function mkreadme {
        touch README.md
    }
}
