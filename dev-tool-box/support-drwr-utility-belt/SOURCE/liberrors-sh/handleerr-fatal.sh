#! /usr/bin/env bash

throw_fatal_error () {
  local ERR_CODE="${1}" 
  ERR_TYPE=""
  ERR_MSG=""

  case $ERR_CODE in
    120)
      ERR_TYPE='Fatal_Generic_error' 
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG='A fatal error has occured. Exiting program.'
			fi
    ;;
    130)
      ERR_TYPE='Fatal_Permission_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG='A fatal permission error has occured. Ensure that you have permission to achieve your goal. Exiting program.'
			fi
    ;;
    140)
      ERR_TYPE='Fatal_User_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      elif [ -n "${2}" ]; then            
        ERR_MSG="${2}"
      else
        ERR_MSG="A fatal user error occured. This usually means you did something that you weren't supposed to do."
      fi
    ;;
    150)
      ERR_TYPE='Fatal_Internal_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      elif [ "${DEBUG}" = true ]; then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE}. The suspected offender is at line ${ERR_CAUSED_BY_LINE}"
      else
        ERR_MSG="An internal error has occured"
      fi
    ;;
    160)
      ERR_TYPE='Fatal_Parser-Comprehension_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="Recheck your input. The syntax provided could not be understood by the parser"
			fi
    ;;
    170)
      ERR_TYPE='Fatal_Path_Expansion_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="The resulting path, after any necessary expansions, does not exist, or else the resource to  which it points is incompatible with the requested operation. "
      fi
    ;;
    180)
		# This error is significant in that it just handles the debug flag and passes to another error. 
		# This error code has to be specified as the first of two codes. 
		# Specifying alone should bug out with a recoverable_Parser-Comprehension_Error(50).
      ERR_TYPE='Fatal_Debug_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      elif [ "${DEBUG}" = true ]; then          
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An error occured during the previous debug session. The \$DEBUG flag is already set. Parsing to find the error type now."
				
      else
        ERR_MSG="An internal error occured while debugging. For more info, set $DEBUG with '--debug'."
      fi
			return 0
    ;;
    190)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    200)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    210)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    220)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    *)
      ERR_TYPE='Fatal_Unknown_Error'
			return 0
    ;;
  esac
  #printf '%s\: %s\: %s' "${0}" "${ERR_TYPE}" "${ERR_MSG}" >&2
	printf '%s\: %s\: ' "${0}" "${ERR_TYPE}" >&2 && echo "${ERR_MSG}" >&2
  export RDT_CUSTOM_ERR_MSG=''
	exit "${ERR_CODE}"
}