#!/bin/bash

# Function: fss_source_lib
# Description:
#   Sources a script from the 'lib' directory of the FunkyShellSearch project.
#   The function takes the name of the library script (without .sh extension)
#   as an argument. It constructs the full path using the FSS_ROOT_DIR
#   environment variable and then sources it.
# Arguments:
#   lib_name - The name of the library script to source (without the .sh
#              extension).
# Returns:
#   1 if the script does not exist or fails to source, otherwise 0.
fss_source_lib() {
    local lib_name=$1
    local lib_path="$FSS_ROOT_DIR/lib/$lib_name.sh"

    if [ ! -f "$lib_path" ]; then
        echo "fss_sourcer.sh Error: Script not found: $lib_path"
        return 1
    fi

	# shellcheck disable=SC1090
    source "$lib_path" || { echo "fss_sourcer.sh Error: Failed to source $lib_path"; return 1; }
}
