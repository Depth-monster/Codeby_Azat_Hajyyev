#!/bin/bash

folder="$HOME/myfolder"

#1
if [ -d "$folder" ]; then
	count=$(ls -1 "$folder" | wc -l)
	echo "There are $count files in "$folder" "
else
	echo ""$folder" doesn't exist "
fi

#2
file2="$folder/file2"
if [ -f "$file2" ]; then
	chmod 664 "$file2"
	echo ""$file2" chmod 664"
else
	echo "No $file2 is there"
fi

#3
empty_files=$(find "$folder" -maxdepth 1 -type f -empty)
if [ -n "$empty_files" ]; then
	echo "Deleting blank files : "
	echo $empty_files
	rm -f $empty_files
else
	echo "There are is no empty files in $folder"
fi

#4
for file in "$folder"/*; do
	if [ -f "$file" ]; then
	sed -i '2,$d' "$file"
	echo "Deleted all non first letters in "$file""
fi
done
