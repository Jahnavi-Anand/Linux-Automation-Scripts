#!/bin/bash

#define recycle bin directory
recycle_bin="$HOME/.recycle_bin"

mkdir -p "$recycle_bin"

#Function to restore
restore_from_recycle_bin(){
	local source="$1"
	local filename=$(basename -- "$source")
	local destination="$HOME/$filename"
	
	if [ -e "$destination" ]; then
		filename="${filename}_$(date +%s)"
		destination="$HOME/$filename"
	fi
	
	mv "$source" "$destination"
	echo "Restored '$source' from recyle bin to: $destination"
}

echo "Files/Folders in recycle Bin: "
ls "$recycle_bin"

read -p "Enter the name of the file/folder to restore: " restore_item

if [ -e "$recycle_bin/$restore_item" ]; then
	restore_from_recycle_bin "$recycle_bin/$restore_item"
else
	echo "Error: File/Folder "$restore_item" not found in recycle bin."
fi