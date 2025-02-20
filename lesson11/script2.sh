#!/bin/bash

#path var initialization 
folder="$HOME/myfolder"

#1 counting files
if [ -d "$folder" ]; then
	count=$(find "$folder" -maxdepth 1 -type f | wc -l)
	echo "There are $count files in $folder "
else
	echo " $folder doesn't exist "
fi

#2 changing accessibility to file2
file2="$folder/file2"
if [ -f "$file2" ]; then
	chmod 664 "$file2"
	echo " $file2 chmod 664"
else
	echo "No $file2 is there"
fi

#3 looking for empty files using find in the same folder(- maxdepth 1) and deleting blank files
empty_files=$(find "$folder" -maxdepth 1 -type f -empty)
if [ -n "$empty_files" ]; then
	echo "Deleting blank files : "
	echo "$empty_files"
	rm -f "$empty_files"
else
	echo "There are is no empty files in $folder"
fi

#4  erasing all letters except of the first
for file in "$folder"/*; do
	if [ -f "$file" ]; then
	sed -i '2,$d' "$file"
	echo "Deleted all non first letters in $file"
fi
done
