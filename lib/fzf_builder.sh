#!/bin/bash

# Script: fzf_builder.sh
# Description:
#   Provides functions to construct a command for the 'fzf' fuzzy file search
#   utility.
#   Designed to be sourced in other scripts or shell sessions.
# Example:
#   source path/to/fzf_builder.sh
#   fzf_add_preview 'cat {}'
#   fzf_add_delimiter ':'
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

# Function: fzf_add_preview_window_options
# Description:
#   Adds preview window options to the 'fzf' command.
# Arguments:
#   options - A string representing the preview window options (e.g.,
#   'top:66%').
fzf_add_preview_window_options() {
    local options=$1
    fzf_command+=("--preview-window" "$options")
}

# Function: fzf_add_delimiter
# Description:
#   Adds a delimiter option to the 'fzf' command options.
# Arguments:
#   delimiter - A string representing the delimiter.
fzf_add_delimiter() {
    local delimiter=$1
    fzf_command+=("--delimiter" "$delimiter")
}

# Function: fzf_execute
# Description:
#   Executes the constructed 'fzf' command.
# Usage:
#   fzf_execute
fzf_execute() {
    "${fzf_command[@]}"
}
