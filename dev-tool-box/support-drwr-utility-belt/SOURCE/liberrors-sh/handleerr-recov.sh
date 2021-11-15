#! /usr/bin/env bash

throw_recoverable_error () {
  ERR_CODE="" 
  ERR_TYPE=""
  ERR_MSG=""
	

	for i in "${@}"; do
		if [ "${i}" = "--custom" ] || [ "${i}" = "-c" ]; then
			local CUSTOM_DEFINED=true
		fi
	done

  case "${ERR_CODE}" in
    10)
			ERR_TYPE='Recoverable_Generic_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      else     	
      	ERR_MSG="An error has occured. Attempting recovery." 
			fi
			return 0
    ;;
    20)
			ERR_TYPE='Recoverable_Permission_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      else     	
      	ERR_MSG="A permission error has occured. Ensure that you have permission to achieve your goal. Attempting recovery."
			fi
			return 0
  	;;  
    30)
      ERR_TYPE='Recoverable_User_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      elif [ -n "${2}" ]; then
        ERR_MSG="${2}"
      else
        ERR_MSG="A user error occured. This usually means you did something that you weren't supposed to do. Attempting recovery now."
      fi
			return 0
    ;;
    40)
			
      ERR_TYPE='Recoverable_Internal_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      elif [ "${DEBUG}" = true ]; then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE}. The suspected offender is at line ${ERR_CAUSED_BY_LINE}"
      else
        ERR_MSG="An internal error has occured"
      fi
			return 0
    ;;
    50)
      ERR_TYPE='Recoverable_Parser-Comprehension_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      else
      	ERR_MSG="Recheck your input. The syntax provided couldn\'t be understood by the parser. Setting ${2} to default."
			fi
			return 0
    ;;
    60)
      ERR_TYPE='Recoverable_Path_Expansion_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      else
				ERR_MSG="The resulting path, after any necessary expansions, does not exist, or else the resource to  which it points is incompatible with the requested operation. Program will attempt to recover."
			fi
			return 0
    ;;
    70)
      ERR_TYPE='Recoverable_Debug_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        CUSTOM_DEFINED=false
      elif [ "${DEBUG}" = true ]; then
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An internal error has occured at line ${ERR_THROWN_BY_LINE} while debugging. The suspected offender is at line ${ERR_CAUSED_BY_LINE}. Program will attempt to recover."
      else
        ERR_MSG="An internal error occured while debugging. For more info, set $DEBUG with '--debug'. Program will attempt to recover."
      fi
			return 0
    ;;
    80)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        # CUSTOM_DEFINED=false
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    90)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        # CUSTOM_DEFINED=false
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    100)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        # CUSTOM_DEFINED=false
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    110)
      ERR_TYPE='-1'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
				# ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
        # CUSTOM_DEFINED=false
      else
      	ERR_MSG="PICK ANOTHER ERROR TYPE!! THIS ERROR CODE IS ILLEGAL AND UNDEFINED!"
			fi
			return 0
    ;;
    *)
      ERR_TYPE='Recoverable_Unknown_error'
      ERR_MSG="An unknown error has occured"
			return 0
    ;;
    esac
		printf '%s\: %s\: %s' "${0}" "${ERR_TYPE}" "${ERR_MSG}" >&2
			export RDT_CUSTOM_ERR_MSG=''
			return "${ERR_CODE}"

}