#! /usr/bin/env bash

throw_recoverable_error () {
  ERR_CODE="" 
  ERR_TYPE=""
  ERR_MSG=""

  case "${ERR_CODE}" in
    10)
      ERR_TYPE='Recoverable_Generic_Error'
      ERR_MSG="An error has occured. Attempting recovery." 
    ;;
    20)
      ERR_TYPE='Recoverable_Permission_Error'
      ERR_MSG="A permission error has occured. Ensure that you have permission to achieve your goal. Attempting recovery."
    ;;  
    30)
      ERR_TYPE='Recoverable_User_Error'
      if [ -n "${2}" ]
      then
        ERR_MSG="${2}"
      else
        ERR_MSG="A fatal user error occured. This usually means you did something that you weren't supposed to do."
      fi
    ;;
    40)
      ERR_TYPE='Recoverable_Internal_Error'
      ERR_MSG=""
    ;;
    50)
      ERR_TYPE='Recoverable_Parser-Comprehension_Error'
      ERR_MSG="Recheck your input. The syntax provided couldn\'t be understood by the parser. Setting ${2} to default."
    ;;
    60)
      ERR_TYPE='Fatal_Path_Expansion_Error'
      ERR_MSG="The resulting path, after any necessary expansions, does not exist. Program will attempt to recover."
    ;;
    70)
      ERR_TYPE='Fatal_Debug_Error'
      if [ "${DEBUG}" = true ]      
      then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE} while debugging. The suspected offender is at line ${ERR_CAUSED_BY_LINE}. Program will attempt to recover."
      else
        ERR_MSG="An internal error occured while debugging. For more info, set $DEBUG with '--debug'. Program will attempt to recover."
      fi
    ;;
    80)
      ERR_TYPE='Recoverable__Error'
      ERR_MSG=""
    ;;
    90)
      ERR_TYPE='Recoverable__Error'
      ERR_MSG=""
    ;;
    100)
      ERR_TYPE='Recoverable__Error'
      ERR_MSG=""
    ;;
    110)
      ERR_TYPE='Recoverable__Error'
      ERR_MSG=""
    ;;
    *)
      ERR_TYPE='Recoverable_Unknown_error'
      ERR_MSG=""
    ;;
    esac
		printf '%s\: %s\: %s' "${0}" "${ERR_TYPE}" "${ERR_MSG}" >&2
}