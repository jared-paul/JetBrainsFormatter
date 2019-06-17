#!/bin/bash
# ------------------------------------------------------
# PhpStorm formatting script.
# ------------------------------------------------------

# absolute path to this script so it can be used regardless of context
SCRIPTDIR="$( cd "$( dirname "$0" )" && pwd )"

# your phpstorm installation bin directory (ex: /snap/phpstorm/current/bin)
phpstorm_directory=$0

# path to config file
configFile="$SCRIPTDIR/config.yml"

# load and set phpstorm_directory from config file
. $configFile

IDE_BIN_HOME="$phpstorm_directory"
export PHPSTORM_PROPERTIES=$SCRIPTDIR/format.properties
exec "$IDE_BIN_HOME/phpstorm.sh" format "$@"
