#!/bin/bash

# Script: ag_builder.sh
# Description:
#   Provides functions to construct a command for the 'ag' (The Silver
#   Searcher) utility. Designed to be sourced in other scripts or shell
#   sessions.
# Example:
#   source $FSS_ROOT_DIR/lib/ag_builder.sh 
#   ag_add_all_types
#   ag_add_ignore_case
#   ag_add_line_numbers
#   ag_set_pattern "example"
#   ag_set_path "/path/to/search"
#   ag_execute

# Initialize the command components
_ag_options=("ag")  # The base command
_ag_pattern=""
_ag_path="."

# Function: ag_add_all_types
# Description:
#   Adds the '-a' option to include all file types in the search.
ag_add_all_types() {
    _ag_options+=("-a")
}

# Function: ag_add_ignore_case
# Description:
#   Adds the '-i' option to make the search case-insensitive.
ag_add_ignore_case() {
    _ag_options+=("-i")
}

# Function: ag_add_line_numbers
# Description:
#   Adds the '--numbers' option to include line numbers in the search results.
ag_add_line_numbers() {
    _ag_options+=("--numbers")
}

# Function: ag_set_pattern
# Description:
#   Sets the search pattern for the 'ag' command.
# Arguments:
#   pattern - A string representing the search pattern.
ag_set_pattern() {
    local pattern=$1
    _ag_pattern="$pattern"
}

# Function: ag_set_path
# Description:
#   Sets the search path for the 'ag' command.
# Arguments:
#   path - A string representing the path where 'ag' will start searching.
ag_set_path() {
    local path=$1
    _ag_path="$path"
}

# Function: ag_echo_command
# Description:
#   Constructs and echoes the complete 'ag' command.
# Usage:
#   ag_echo_command
ag_echo_command() {
    local ag_command=("${_ag_options[@]}")
    [ -n "$_ag_pattern" ] && ag_command+=("$_ag_pattern")
    [ -n "$_ag_path" ] && ag_command+=("$_ag_path")

    echo "Constructed command: ${ag_command[*]}"
}

# Function: ag_execute
# Description:
#   Builds and executes the 'ag' command.
# Usage:
#   ag_execute
ag_execute() {
    local ag_command=("${_ag_options[@]}")
    [ -n "$_ag_pattern" ] && ag_command+=("$_ag_pattern")
    [ -n "$_ag_path" ] && ag_command+=("$_ag_path")

    "${ag_command[@]}"
}
