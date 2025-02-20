#!/bin/bash

#initializing variable folder
folder="$HOME/myfolder"

#checking if a path exists
if [  ! -d "$folder" ]; then
mkdir "$folder"
fi

#going forward if the path exists and  completing 1-5 exercises
for i in {1..5}
do
	case $i in
	1)
	touch "$folder/file$i"
	echo "Hello" > "$folder/file$i"
	date >> "$folder/file$i"
	echo "Created file$i"
	;;
	2)
	touch "$folder/file$i"
	chmod 777 "$folder/file$i"
	echo "Created blank file$i"
	;;
	3)
	touch "$folder/file$i"
	head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 > "$folder/file$i"
	echo "Created file$i"
	;;
	4|5)
	touch "$folder/file$i"
	echo "Created blank file$i"
	;;
esac
done
