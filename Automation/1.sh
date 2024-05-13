#!/bin/bash

# Define paths
log_directory="/home/vboxuser/var/log/"
backup_directory="/home/vboxuser/backup/logs/"

# Define filename and archive name
log_filename="example.log"
archive_name="example_$(date +"%Y%m%d_%H%M%S").tar.gz"

# Move to log directory
cd "$log_directory" || exit

# Check if log file exists
if [ -f "$log_filename" ]; then
    # Archive log file
    tar -czvf "$archive_name" "$log_filename"
   
    # Move archive to backup directory
    mv "$archive_name" "$backup_directory"
   
    echo "Log archived and moved to backup directory."
else
    echo "Log file not found."
fi