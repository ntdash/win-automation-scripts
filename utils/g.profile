#! /usr/bin/env bash

[[ -z $cmd_name ]] && exit 1;

export cmd_pathname="${scripts_path}/commands/${cmd_name}"
export sub_cmd_pathname="${cmd_pathname}/subs"

potential_pathnames=( "helper" "profile" )

# source files

for _name in ${potential_pathnames[@]}
do
	dot_path="${cmd_pathname}/utils/.${_name}"
	path_dot_d="${cmd_pathname}/utils/${_name}.d"

	# source list of files if _name is directory
	if [[ -d $path_dot_d ]]
	then

		for _file in $(ls -A $path_dot_d)
		do
			_resolve_path="${path_dot_d}/${_file}";

			[[ -f $_resolve_path ]] && source $_resolve_path

		done
	fi

	# if file source it
	[[ -f $dot_path ]] && source $dot_path

done
