#! /usr/bin/bash

function mksrcdirtree () {

    for i in ./*
    do
        echo $i
        if [ -d $i ]    
        then
            echo "Adding directories to $i."
            mkdir -p $i/{MISC,RESOURCES,SOURCE,TARGET,TEST}
            echo "All good!"
        else    
            errmsg=$([ -d $i ])
            echo "ERROR: couldn't make directories!"
            echo errmsg
            return 1
        fi
    done
}