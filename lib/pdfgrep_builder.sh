#!/bin/bash

# Script: pdfgrep_builder.sh
# Description:
#   Provides functions to construct and execute a command for the 'pdfgrep' 
#   utility.
#   Designed to be sourced in other scripts or shell sessions.
# Example:
#   source $FSS_ROOT_DIR/pdfgrep_builder.sh 
#   pdfgrep_add_ignore_case
#   pdfgrep_add_recursive
#   pdfgrep_add_print_page_number
#   pdfgrep_set_pattern "example pattern"
#   pdfgrep_add_files "file1.pdf" "file2.pdf"
#   pdfgrep_execute

_pdfgrep_options=()      # Array to store pdfgrep options
_pdfgrep_pattern=""      # Variable to store the search pattern
_pdfgrep_files=()        # Array to store the files to be searched

# Function: pdfgrep_add_ignore_case
# Description:
#   Makes the search case-insensitive.
pdfgrep_add_ignore_case() {
    _pdfgrep_options+=("-i")
}

# Function: pdfgrep_add_recursive
# Description:
#   Adds the recursive search option.
pdfgrep_add_recursive() {
    _pdfgrep_options+=("-r")
}

# Function: pdfgrep_add_print_page_number
# Description:
#   Adds the option to print page numbers where matches are found.
pdfgrep_add_print_page_number() {
    _pdfgrep_options+=("-n")
}

# Function: pdfgrep_set_pattern
# Description:
#   Sets the search pattern for the 'pdfgrep' command.
# Arguments:
#   pattern - A string representing the search pattern.
pdfgrep_set_pattern() {
    _pdfgrep_pattern="$1"
}

# Function: pdfgrep_add_files
# Description:
#   Adds files to the list of files to be searched.
# Arguments:
#   files - An array of files to be added to the search.
pdfgrep_add_files() {
    _pdfgrep_files+=("${@:1}")
}

# Function: pdfgrep_echo_command
# Description:
#   Constructs and echoes the complete 'pdfgrep' command for review.
pdfgrep_echo_command() {
    local pdfgrep_command=("pdfgrep" "${_pdfgrep_options[@]}" "$_pdfgrep_pattern" "${_pdfgrep_files[@]}")

    echo "Constructed command: ${pdfgrep_command[*]}"
}

# Function: pdfgrep_execute
# Description:
#   Builds and executes the 'pdfgrep' command based on the current settings.
#   Defaults to searching in the current directory and subdirectories if no
#   specific files are provided.
pdfgrep_execute() {
    local pdfgrep_command=("pdfgrep" "${_pdfgrep_options[@]}" "$_pdfgrep_pattern")

	# If no files have been added, search in the current directory and
	# subdirectories
    if [ ${#_pdfgrep_files[@]} -eq 0 ]; then
        pdfgrep_command+=(".")
    else
        pdfgrep_command+=("${_pdfgrep_files[@]}")
    fi

    "${pdfgrep_command[@]}"
}
