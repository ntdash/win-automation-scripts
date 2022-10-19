#! /usr/bin/env bash

declare -x cmd_pathname="${scripts_path}/commands/${cmd_name}"
declare -x sub_cmd_pathname="${cmd_pathname}/subs"
declare -x tprefix="copts-b"

# parsed_options buffer
declare -x parsed_options="$(mktemp -t ${tprefix}.${cmd_name}.XXXXXXX)"

# remove when exiting
trap "rm -f ${parsed_options}" EXIT


declare _partials=( "helper" "profile" )

# loop variables
declare _entry= dot_path= path_dot_d=

for _entry in ${_partials[@]}
do
	dot_path="${cmd_pathname}/utils/.${_entry}"
	path_dot_d="${cmd_pathname}/utils/${_entry}s.d"

	# source list of files if _entry is directory
	if [[ -d $path_dot_d ]]
	then
		# loop variables
		declare _pathname=

		for _pathname in $(find $path_dot_d -type f)
		do
			source $_pathname
		done
	fi

	# if file source it
	if [[ -f $dot_path ]]
	then
		source $dot_path
	fi

done
