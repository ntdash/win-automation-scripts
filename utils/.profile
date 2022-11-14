#! /usr/bin/env bash

# data related
declare -x data_pathname="${root_basename}/data"
declare -x command_data_pathname="${data_pathname}/${command_name}"

# subcommand related
declare -x subcommand_name="" subcommand_pathname="${command_pathname}/subs"

# serialized parsed options
declare -x serialized_parsed_options=""

# load subcommnd helper.d's content

declare command_helpers_pathname="${command_pathname}/utils/helpers.d"

declare partial=

while read partial
do
	source $partial

done <<< "$( find ${command_helpers_pathname} -type f -iname '.*' )"

# load command at last profile

declare command_profile_filepath="${command_pathname}/utils/.profile"

if [[ ! -f "${profile_filepath}" ]]
then
	echo "Failed to load ${command_name} profile's file at: ${command_profile_filepath}"
	exit 127
fi

source $command_profile_filepath
