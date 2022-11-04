#! /usr/bin/env bash

declare -xg subcommand_pathname="${command_pathname}/subs"
declare -x tprefix="copts-b"

# parsed_options buffer
declare -x parsed_options="$(mktemp -t ${tprefix}.${command_name}.XXXXXXX)"

# remove when exiting
trap "rm -f ${parsed_options}" EXIT

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
