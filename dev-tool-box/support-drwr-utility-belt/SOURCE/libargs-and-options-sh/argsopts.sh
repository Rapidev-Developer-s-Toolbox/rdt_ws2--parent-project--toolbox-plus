#! /usr/bin/env bash

source {../liberrors-sh/*\.sh}

source "./parser_hooks\.sh" 

EXTGLOB_STATUS=$(shopt extglob) | tr -s [:blank:]
OPTS_ONLY=false
declare -a AO_INPUT_ARRAY=${@}
declare -a OA_OPT_ARRAY
declare -a OA_ARG_ARRAY
declare -A OA_OPTARG_ARRAY

#specify any added options to the space-separated list below, as soon as they are added.  


ao_sort (){
	for i in AO_INPUT_ARRAY; do
		RDTAO_HELPER__opts_from_args
	#	case j in "${i}"
	done
}


ao_set () {
	true
}

ao_to_assoc () {
	true
}

# This is called to specify that there are no args 
# at the end of the input. Needs to set the mechanics 
# accordingly. Same as ending input with "--"
ao_allopts () {
	"${ALLOPTS}"=true
}

if [ "${EXTGLOB_STATUS}" = "extglob on" ]; then
	shopt -s extglob
else [ "${EXTGLOB_STATUS}" = "extglob off" ]; then
	shopt -u extglob
fi

for i in "${AO_INPUT_ARRAY[@]}"; do
  case "${i}" in 
	"")
		true
	;;
	*)
		true
	;;
	esac
done


#-----------------------------------------------


#AO INTERNAL HELPER FUNCTIONS
#
# usage:
#     oai_ofroma N1 N2 [optional-mutator]
#                     separates separates input array into opts_arr and args_arr.
#                     N1 + N2 MUST equal total of all elements. Otherwise an error is thrown
RDTAO_HELPER__opts_from_args (){
	# checks later
	declare -a 
	declare -a OA_ARG_ARRAY
	declare -A OA_OPTARG_ARRAY
	declare -a func_in_arr

	for n in seq "${1}"; do
		OA_OPT_ARRAY=func_in_arr[seq ]
	done
	
	declare -a args_arr
	local firstarg="${1}"+1
	local total="${1}"+"${2}"

	if [ -n "${3}" ]; then
		#set func_in_arr based on mutator
		true
	else
		func_in_arr="${AO_INPUT_ARRAY[@]}"
	fi

	for local z in seq "${1}"; do
		opts_arr[z]=func_in_arr[z]
	done

	for local y in seq "${1}+1" ; do
		opts_arr[z]=func_in_arr[z]
	done

	for 
}
#
# usage:
#    aoi_parseopts FIRSTARG-INDEX 
#                     (specify the cutoff. Either FIRSTARG-INDEX is the last input on the command line (all opts), or the next element after FIRSTARG-INDEX must be an opt)
RDTAO_HELPER__parseargs (){
	true
}

# usage:
#    aoi_parseopts LASTOPT-INDEX 
#                     (specify the cutoff. Either LASTOPT-INDEX is the last input on the command line (all opts), or the next element after LASTOPT-INDEX must be an arg)
aoi_parseopts (){
	if [  ]
}

mk_optstring_array (){

}

