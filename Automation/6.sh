#!/bin/bash

# Define forbidden command
forbidden_command=","
forbidden_command_found=false

# Check if the script contains the forbidden command
if grep -q "$forbidden_command" "$0"; then
    forbidden_command_found=true
fi

# Execute only if the forbidden command is not found
if [ "$forbidden_command_found" = false ]; then
    # Your script content here
    echo "This is the script content."
else
    echo "Forbidden command detected. Execution aborted."
fi