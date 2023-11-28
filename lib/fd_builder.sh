#!/bin/bash

# Script: fd_builder.sh
# Description:
#   Provides functions to construct a command for the 'fd' file search utility.
#   Designed to be sourced in other scripts or shell sessions. The constructed
#   command is stored in a global variable 'g_fd_command', making it available
#   as an environment variable in the sourcing file.

# Initialize the global fd command array
g_fd_command=("fd")

# Function: fd_add_type
# Description:
#   Adds a search type to the 'fd' command. Appends the '-t' option with the
#   specified type to the existing 'g_fd_command' array.
# Arguments:
#   type - A string representing the type of search (e.g., 'f' for file, 'd'
#          for directory).
fd_add_type() {
    local type=$1
    g_fd_command+=("-t" "$type")
}

# Function: fd_add_extensions
# Description:
#   Adds file extensions to the 'fd' search command.
#   Appends one or more '-e' options to the 'g_fd_command' array.
# Arguments:
#   extensions - An array of file extensions to include in the search.
fd_add_extensions() {
    local extensions=("${@:1}")
    for ext in "${extensions[@]}"; do
        g_fd_command+=("-e" "$ext")
    done
}

# Function: fd_add_ignore_case
# Description:
#   Makes the search case-insensitive for the 'fd' command.
#   Appends the '-i' option to the 'g_fd_command' array.
fd_add_ignore_case() {
    g_fd_command+=("-i")
}

# Function: fd_add_pattern
# Description:
#   Adds a search pattern to the 'fd' command.
#   Appends the specified pattern to the 'g_fd_command' array.
# Arguments:
#   pattern - A string representing the search pattern.
fd_add_pattern() {
    local pattern=$1
    if [ -n "$pattern" ]; then
        g_fd_command+=("$pattern")
    fi
}
