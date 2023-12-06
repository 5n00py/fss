#!/bin/bash

# Script: fzf_builder.sh
# Description:
#   Provides functions to construct a command for the 'fzf' fuzzy file search utility.
#   Designed to be sourced in other scripts or shell sessions.
# Example:
#   source path/to/fzf_builder.sh
#   fzf_add_preview 'cat {}'
#   fzf_build_command

# Initialize the fzf command with default options
fzf_command=("fzf")

# Function: fzf_add_preview
# Description:
#   Adds a preview command to the 'fzf' command options.
# Arguments:
#   preview_command - A string representing the preview command.
fzf_add_preview() {
    local preview_command=$1
    fzf_command+=("--preview" "$preview_command")
}

# Function: fzf_execute
# Description:
#   Executes the constructed 'fzf' command.
# Usage:
#   fzf_execute
fzf_execute() {
    "${fzf_command[@]}"
}
