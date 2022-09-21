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

		for _filename in $(find $path_dot_d -type f)
		do
			source $_filename
		done
	fi

	# if file source it
	[[ -f $dot_path ]] && source $dot_path

done
