A script to format code in specified folders/files using Phpstorms formatting tool

### Installation:

Clone this repo into the folder where you keep all of your dev projects

Define your Phpstorm's main bin folder (where phpstorm.sh is located) in the config file
Define your project folder in the config file

Specify the folders or files you want to format in the "directories" file 

The default config values are based off my box so they should pretty much be the same for everyone

### Use:

Run the script by entering "bash format_files.sh" or "./format_files.sh" in your terminal.

Note: You don't need to `cd` to the folder containing the format_files.sh. You can run it from anywhere.

(the script will modify the format.properties file so git will think it was changed by you, just ignore this)

The script will ask you to specify a project to format, if you enter nothing it will default to whatever "default_project" is set to in config.yml

Done! now all of the specified directories/files should be formatted according to the style found in "format/team_format.xml"

### Updating:

To update the formatter just run the main "format_files" script and it will auto update for you
You can also run "git pull" to get the latest changes
