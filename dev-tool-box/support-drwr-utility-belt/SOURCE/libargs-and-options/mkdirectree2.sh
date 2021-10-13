#! /usr/bin/bash


# Set up environment variables for the runner shell
function init {
# This is the dir inside of which the tree will be created, aka the parent directory, aka the base. Set with the 1st value arg. Should be $2, $1 should be '--parent' or '-p'. 

# TODO: write function to set PROJECT_TYPE to DEB,SBOOT,etc.

if [[ "${1}" = '$(--parent' ]] | [[ "${1}" = "-parent" ]];then
    if [[  ]]
    echo ''
    DT_BASE=$

ARG_TYPE=-1
ARG_SUBTYPE=-1
PROJECT_TYPE=-1
NEEDS_PARSED='Y'
PARENT=-1


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



function mksrcdirtree {

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



            echo "All good!"
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
