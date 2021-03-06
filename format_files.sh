#!/bin/bash

# absolute path to script so it can be used regardless of context
SCRIPTDIR="$( cd "$( dirname "$0" )" && pwd )"

# LOADING CONFIG START
# absolute path to config file
config_file="$SCRIPTDIR/config.yml"

# the base directory where all your dev projects are hosted
projects_directory=$2

# the default project you want to format if none is specified
default_project=$3

source $config_file
# LOADING CONFIG END

# UPDATER START
cd $projects_directory/formatter
:

printf "Checking for updates...\n"

changed=0
git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
if [ $changed = 1 ]; then
    	printf "Your branch is out of date, updating now...\n";
	git pull
	printf "Successfully updated!\n"
else
    printf "Up to date!\n"
fi
# UPDATER END

# FORMATTER START
# the project you want to format
project=""

# all of the directories to include in formatting
directories=""

# relative path to directories file
directories_file="$SCRIPTDIR/directories.yml"

# relative path to properties file
properties_file="$SCRIPTDIR/format.properties"

# set necessary idea config and system path in properties file
config_path="$SCRIPTDIR/instance_container/config"
system_path="$SCRIPTDIR/instance_container/system"

sed -i "s@config_path@$config_path@g" $properties_file
sed -i "s@system_path@$system_path@g" $properties_file

read -p "Please specify the project you want to format: " project

if [ "$project" == "" ]; then
	printf "Formatting default project: $default_project\n"
	project=$default_project
else
	printf "Formatting project: $project\n"
fi

while IFS= read -r directory
do
	directories="$directories $projects_directory/$project/$directory/"
done < "$directories_file"

printf "Formatting all files in $directories \n...\n"

sh $SCRIPTDIR/format.sh -r -s $SCRIPTDIR/format/team_format.xml $directories
# FORMATTER END
