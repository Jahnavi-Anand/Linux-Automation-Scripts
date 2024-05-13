#!/bin/bash

#Defining the log file path
log_file="$HOME/del.log"

#Function
log_del_action(){
	local action="$1"
	local file="$2"
	local timestamp=$(date +"%Y-%m-%d %T")
	
	#Log deletion action with timestamp and file
	echo "$timestamp - $action: $file" >> "$log_file"
}

#Monitoring deleted files/folders
inotifywait -m -e delete "$HOME" | while read -r directory event filename
do
	if [ "$event" = "DELETE" ]; then
		#checking if deletd items exists
		if [ -e "$directory/$filename" ]; then
			#log deleted action
			log_del_action "Deleted" "$directory/$filename"
		else
			echo "Error: Deleted item '$directory/$filename' not found."
		fi
	fi
done