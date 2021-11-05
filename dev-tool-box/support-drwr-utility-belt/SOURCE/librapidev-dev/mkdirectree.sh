#! /usr/bin/bash

function mksrcdirtree () {

    for i in ./*
    do
        echo "$i"
        if [ -d "$i" ]    
        then
            printf 'Adding directories to %s.' "${i}".
    # TODO:Conditionally add more nested expansions to the glob param of mkdir below,
    # in order to satisfy relatedoptions, as they are intr   Remove
            mkdir -p "${i}"/{MISC,RESOURCES,SOURCE,TARGET,TEST}
            echo "All good!"
        else    
            errmsg=$([ -d "$i" ])
            echo "ERROR: couldn't make directories!"
            echo errmsg
            return 1
        fi
    done
}