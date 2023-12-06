#!/bin/bash

# Script: fd_builder.sh
# Description:
#   Provides functions to construct a command for the 'fd' file search utility.
#   Designed to be sourced in other scripts or shell sessions.
# Example:
#   source $FSS_ROOT_DIR/lib/fd_builder.sh 
#   fd_add_type "f"
#   fd_add_extensions "txt" "md"
#   fd_add_ignore_case
#   fd_set_pattern "example"
#   fd_set_path "/path/to/search"
#   fd_execute

# Parse the FD configuration from the fss.config file
parse_config "FD"

# Initialize the command components using the command name from the
# configuration
_fd_options=("${COMMAND_NAME:-fd}")  # Default to 'fd' if COMMAND_NAME is not set
_fd_pattern=""
_fd_path="."

# Function: fd_add_type
# Description:
#   Adds a search type '-t' option to the 'fd' options.
# Arguments:
#   type - A string representing the type of search (e.g., 'f' for file, 'd'
#          for directory).
fd_add_type() {
    local type=$1
    _fd_options+=("-t" "$type")
}

# Function: fd_add_extensions
# Description:
#   Adds file extensions to the 'fd' search options.
#   Appends one or more '-e' options to the '_fd_command' array.
# Arguments:
#   extensions - An array of file extensions to include in the search.
fd_add_extensions() {
    local extensions=("${@:1}")
    for ext in "${extensions[@]}"; do
        _fd_options+=("-e" "$ext")
    done
}

# Function: fd_add_ignore_case
# Description:
#   Makes the search case-insensitive for the 'fd' command.
#   Appends the '-i' option to the fd options.
fd_add_ignore_case() {
    _fd_options+=("-i")
}

# Function: fd_add_pattern
# Description:
#   Sets the search pattern for an 'fd' command.
# Arguments:
#   pattern - A string representing the search pattern.
fd_set_pattern() {
    local pattern=$1
    _fd_pattern="$pattern"
}

# Function: fd_set_path
# Description:
#   Sets the search path for the 'fd' command.
#   This function updates the '_fd_path' variable with the specified path.
# Arguments:
#   path - A string representing the path where 'fd' will start searching.
fd_set_path() {
    local path=$1
    _fd_path="$path"
}

# Function: fd_echo_command
# Description:
#   Constructs and echoes the complete 'fd' command from the global variables.
#   It combines options, pattern, and path into a single command string.
#   This function ensures that empty patterns or paths are not included.
#   The command is echoed for review or external execution, but not executed.
# Usage:
#   fd_echo_command
#   After calling this function, the constructed command is displayed.
fd_echo_command() {
    local fd_command=("${_fd_options[@]}")
    [ -n "$_fd_pattern" ] && fd_command+=("$_fd_pattern")
    [ -n "$_fd_path" ] && fd_command+=("$_fd_path")

    echo "Constructed command: ${fd_command[*]}"
}

# Function: fd_execute
# Description:
#   Builds and executes the 'fd' command based on the current settings.
# Usage:
#   fd_execute
fd_execute() {
    local fd_command=("${_fd_options[@]}")
    [ -n "$_fd_pattern" ] && fd_command+=("$_fd_pattern")
    [ -n "$_fd_path" ] && fd_command+=("$_fd_path")

    "${fd_command[@]}"
}
