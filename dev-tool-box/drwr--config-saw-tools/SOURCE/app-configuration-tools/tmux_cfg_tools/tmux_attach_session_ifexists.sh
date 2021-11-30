#! /usr/bin/env bash
DATA_DIR=~/rdt_data
VERB=false
for arg in "${@}"
do
  if [ "${arg}" = "-v" ] || [ "${arg}" = "--verbose" ]
  then
    VERB=true
  fi
done
if [ ! -d "${DATA_DIR}" ]
then
  if [ "${VERB}" = true ]
  then
    printf 'no RDT data directory found. Making one now. Location: %s' "${DATA_DIR}"
  fi
  mkdir "${DATA_DIR}" || err_cldnt_mk
fi
mktemp 
touch 
tmux ls 

err_cldnt_mk () {
  printf "ERROR: couldn\'t make %s" "${ISSUE_OBJ}"


}