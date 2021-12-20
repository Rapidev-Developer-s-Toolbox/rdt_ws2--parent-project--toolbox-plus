#! /usr/bin/env bash

declare -A allopts_hooks_array=()

parseropts (){
	if [[ "${1}" =~ \- ]]
} 





--------------------------------------------------

###  PRIVATE HELPERS


# called once per opt, above

RDTAO_HELPER_handle_option (){

}

_map_cases () {
	declare -a casemap
	for c in {AO_INPUT_ARRAY[@]}; do
		if [[ "${c}" =~ \-.* ]] ; then
			{casemap["${c}"]}='O'
		fi
		
		if [[ "${c}" =~ \-.* ]]
		else
			{casemap["${c}"]}='A'
}