#!/bin/bash

# Log file path
log_file="/var/log/apache2/access.log"  

# Temporary file to store summary
summary_file="/tmp/web_server_summary.txt"

# Generate summary
echo "Web Server Request Summary for $(date +"%Y-%m-%d"):" > "$summary_file"
echo "" >> "$summary_file"
echo "Top 10 Requested URLs:" >> "$summary_file"
echo "-----------------------" >> "$summary_file"
awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr | head -10 >> "$summary_file"
echo "" >> "$summary_file"
echo "Total Requests Today: $(grep "$(date +"%d/%b/%Y")" "$log_file" | wc -l)" >> "$summary_file"

# Email the summary
mailx -s "Web Server Request Summary - $(date +"%Y-%m-%d")" your_email@example.com < "$summary_file"

# Clean up temporary summary file
rm "$summary_file"