#! /usr/bin/env bash

throw_fatal_error () {
  local ERR_CODE="${1}" 
  ERR_TYPE=""
  ERR_MSG=""

  case $ERR_CODE in
    120)
      ERR_TYPE='Fatal_Generic_error' 
      ERR_MSG='A fatal error has occured. Exiting program.'
    ;;
    130)
      ERR_TYPE='Fatal_Permission_Error'
      ERR_MSG='A fatal permission error has occured. Ensure that you have permission to achieve your goal. Exiting program.'
    ;;
    140)
      ERR_TYPE='Fatal_User_Error'
      if [ -n "${2}" ]
      then       
        ERR_MSG="${2}"
      else
        ERR_MSG="A fatal user error occured. This usually means you did something that you weren't supposed to do."
      fi
    ;;
    150)
      ERR_TYPE='Fatal_Internal_Error'
      if [ "${DEBUG}" = true ]      
      then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE}. The suspected offender is at line ${ERR_CAUSED_BY_LINE}"
      else
        ERR_MSG="An internal error has occured"
      fi
    ;;
    160)
      ERR_TYPE='Fatal_Parser-Comprehension_Error'
      ERR_MSG="Recheck your input. The syntax provided could not be understood by the parser"
    ;;
    170)
      ERR_TYPE='Fatal_Path_Expansion_Error'
      ERR_MSG="The resulting path, after any necessary expansions, does not exist."
      
    ;;
    180)
      ERR_TYPE='Fatal_Debug_Error'
      if [ "${DEBUG}" = true ]      
      then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE} while debugging. The suspected offender is at line ${ERR_CAUSED_BY_LINE}"
      else
        ERR_MSG="An internal error occured while debugging. For more info, set $DEBUG with '--debug'."
      fi
    ;;
    190)
      ERR_TYPE='Fatal__Error'
    ;;
    200)
      ERR_TYPE='Fatal__Error'
    ;;
    210)
      ERR_TYPE='Fatal__Error'
    ;;
    220)
      ERR_TYPE='Fatal__Error'
    ;;
    *)
      ERR_TYPE='Fatal_Unknown_Error'
    ;;
  esac
  printf '%s\: %s\: %s' "${0}" "${ERR_TYPE}" "${ERR_MSG}" >&2
  exit "${ERR_CODE}"
}