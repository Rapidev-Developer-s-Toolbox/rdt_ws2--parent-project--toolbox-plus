#! /usr/bin/env bash

# Needs to take in a search term, and optionally a g|G and additional keyword, and return a list of packages, one
# per line. If g, grep the search results for keyword. if G, grep the list for keyword. MINIMAL ERROR CHECKING! USER IS 
# RESPONSIBLE FOR THIS! If you need error checking, use the front-end. All error checks are contained within.

# Grep-type: -1=error; 0=unset; 1=no-grep; 2=pre-grep; 3=post-grep
GREP=0
SEARCH_TERM=''
GREP_TERM=''

case "${#}" in

1)