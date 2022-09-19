#! /usr/bin/env bash

[[ -z $cmd_name ]] && exit 1;

export cmd_path="${scripts_path}/commands/${cmd_name}"
export sub_cmd_path="${cmd_path}/subs"

partials=( "helper" "profile" )

# source files

for _file in ${partials[@]}
do
	filename="${cmd_path}/utils/.${_file}"

	[[ ! -f $filename ]] && echo "$filename is missing" && exit;

	# source file if exists
	. $filename

done
