#!/bin/bash

#Defining recycle bin directory
recycle_bin="$HOME/.recycle.bin"

#Creating recycle bin directory if it doesn't exist
mkdir -p "$recycle_bin"

#Function to move files/folders to recycle bin
move_to_recycle_bin(){
	local source="$1"
	local filename=$(basename -- "$source")
	local destination="$recycle_bin/$filename"
	
	#Checking if file/folder already exists in recycle bin
	if [ -e "$destination" ]; then
		#Appending timestamp to filename to avoid overwriting
		filename="${filename}_$(date +%s)"
		destination="$recycle_bin/$filename"
	fi
	
	#Moving file/folder to recycle bin
	mv "$source" "$destination"
	echo "Moved" '$source' to recycle bin: $destination
}

#Monitoring deleted files/folders
inotifywait -m -e delete --format "%w%f" "$HOME" | while read deleted_files
do
	#checking if deleted item exists
	if [ -e "$deleted_file" ]; then
		#Moving deleted item to recycle bin
		move_to_recycle_bin "$deleted_file"
	fi
done