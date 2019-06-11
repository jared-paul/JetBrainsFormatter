#!/bin/bash
# ------------------------------------------------------
# PhpStorm formatting script.
# ------------------------------------------------------

# your phpstorm installation bin directory (ex: /snap/phpstorm/current/bin)
phpstorm_directory=$0

# path to config file
configFile="./config.yml"

# load and set phpstorm_directory from config file
. $configFile

IDE_BIN_HOME="$phpstorm_directory"
export PHPSTORM_PROPERTIES=format.properties
exec "$IDE_BIN_HOME/phpstorm.sh" format "$@"
