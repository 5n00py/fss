#!/bin/bash

# Function: parse_config 
# Description:
#   Parses a specified section of the 'fss.conf' configuration file. It reads
#   key-value pairs from the specified section and sets them as global
#   environment variables. Designed for use by sourcing this script and then
#   calling the function with a desired section name. This makes the
#   configuration settings from that section available as environment variables
#   in the sourcing file.
#
# Arguments:
#   section: A string representing the section of the configuration file to
#            parse.
#
# Outputs:
#   Writes an error message to standard output if the configuration file is not
#   found. Sets global variables based on the configuration file's content.
#
# Globals:
#   Variables defined in the specified section of the configuration file.
parse_config() {
    local section=$1
    local in_section=false
    local config_file="$FSS_ROOT_DIR/config/fss.conf"

    # Check if configuration file exists
    if [ ! -f "$config_file" ]; then
        echo "config_parser.sh Error: Configuration file not found: $config_file"
        exit 1
    fi

    while IFS='=' read -r line_key line_value; do
        if [[ $line_key =~ ^\[$section\]$ ]]; then
            in_section=true
            continue
        fi

        if $in_section && [[ $line_key =~ ^[A-Z_]+$ ]]; then
            eval "$line_key=$line_value"
        elif [[ $line_key =~ ^\[.*\]$ ]]; then
            in_section=false
        fi
    done < "$config_file"
}
