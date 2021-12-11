#! /usr/bin/env bash

throw_fatal_error () {
  if [ "${#}" -ge 5 ]; then
  dbg_str="${@}"
  for p in "${dbg_str}"; do
    
  handle_debug_condition 


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
      ERR_TYPE='Fatal_Generic_Parser-Compehension_Error'
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
      CALLER
      ERR_TYPE='Fatal_User_Input_Error'
			if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
			
      else
      	ERR_MSG="One or more of the values supplied as args to the previous command were not recognized. Check your specified args, or \
if you are working with pipelines, ensure that other commands are operating in the way that you expect."
			fi
			return 0
    ;;
    190)
		# This error is significant in that it just handles the debug flag and passes to another error. 
		# This error code has to be specified as the first of two codes. 
		# Specifying alone should bug out with a recoverable_Parser-Comprehension_Error(50).
      ERR_TYPE='Fatal_Debug_Error'
      if [ "${CUSTOM_DEFINED}" = true ]; then
				ERR_MSG="${RDT_CUSTOM_ERR_MSG}"
      elif [ "${RDT_DEBUG}" = true ]; then          
        ERR_THROWN_BY_LINE="${2}"
        ERR_CAUSED_BY_LINE="${3}"
        ERR_MSG="An error occured during the previous debug session. The \$RDT_DEBUG flag is already set. It is set automatically as a result  Parsing to find the error type now."
				
      else
        ERR_MSG="An internal error occured while debugging. For more info, set $DEBUG with '--debug'."
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

throw_fatal_debug_error () {
  # must be called with:  throw_fatal_error  <CODE>  <CAUSED_LINE>  <THROWN_LINE> '_RDT_DEBUG'
  # Note that, while the first 3 params in the call above are placeholders, '_RDT_DEBUG' is a literal. The syntax must be exactly as shown, and it must be $4, with the first param
  # ($1) being a valid fatal-error code (120, 130, 140, 150, 160, 170, or 180) representing the type of debug error being thrown, the second ($2) being the number of the line 
  # suspected of throwing the error, and the third param ($3) being the number of the line where the error was caused. This function validates these conditions are true. If these
  # conditions are validated as acceptable, it sets up the nvvironment and calls the main function in 'debug mode'.   
  RDT_DEBUG=true
}