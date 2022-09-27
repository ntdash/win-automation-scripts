#! /usr/bin/env bash

[[ -z $cmd_name ]] && exit 1;

declare -x cmd_pathname="${scripts_path}/commands/${cmd_name}"
declare -x sub_cmd_pathname="${cmd_pathname}/subs"
declare -x parsed_options="$(mktemp -t c_opt.${cmd_name}.XXXXX)"


_partials=( "helper" "profile" )

# source files

for _name in ${_partials[@]}
do
	dot_path="${cmd_pathname}/utils/.${_name}"
	path_dot_d="${cmd_pathname}/utils/${_name}s.d"

	# source list of files if _name is directory
	if [[ -d $path_dot_d ]]
	then

		for _filename in $(find $path_dot_d -type f)
		do
			source $_filename
		done
	fi

	# if file source it
	[[ -f $dot_path ]] && source $dot_path

done
