#!/bin/bash

# Define paths
log_directory="/var/log/"
backup_directory="/backup/logs/"

# Define filename and archive name
log_filename="example.log"
archive_prefix="example_$(date +"%Y%m%d")" # Prefix to match archive files for deletion

# Move to log directory
cd "$log_directory" || exit

# Check if log file exists
if [ -f "$log_filename" ]; then
    # Generate timestamped archive name
    archive_name="$archive_prefix_$(date +"%H%M%S").tar.gz"
   
    # Archive log file
    tar -czvf "$archive_name" "$log_filename"
   
    # Move archive to backup directory
    mv "$archive_name" "$backup_directory"
   
    echo "Log archived and moved to backup directory."
   
    # Delete archive files older than two days
    find "$backup_directory" -name "${archive_prefix}*" -type f -mtime +2 -exec rm {} \;
   
    echo "Old archive files deleted."
else
    echo "Log file not found."
fi