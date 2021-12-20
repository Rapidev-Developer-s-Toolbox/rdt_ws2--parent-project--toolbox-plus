#! /usr/bin/env bash


# USAGE:
#     ao_2switchconf ["space" "separated" "list" "of" "opts" "and" "args"]
#
## Entire args-list (from $1 to ${$#}) must be sent to args-list of 'ao_2switchconf'.
## Fortunately, we have included a convenience method, so you just need to make a function 
## call, and the library does the rest of the work. The function that needs to be invoked is:

ao_2switchconf_autoparse () {
    xargs
}


