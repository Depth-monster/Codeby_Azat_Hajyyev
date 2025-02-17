#!/bin/bash
if [  ! -d "$HOME/myfolder" ]; then
mkdir "$HOME/myfolder"
fi

for i in {1..5}
do
	case $i in
	1)
	touch "$HOME/myfolder/file$i"
	echo "Hello" > "$HOME/myfolder/file$i"
	date >> "$HOME/myfolder/file$i"
	echo "Created file$i"
	;;
	2)
	touch "$HOME/myfolder/file$i"
	chmod 777 "$HOME/myfolder/file$i"
	echo "Created blank file$i"
	;;
	3)
	touch "$HOME/myfolder/file$i"
	head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 > "$HOME/myfolder/file$i"
	echo "Created file$i"
	;;
	4|5)
	touch "$HOME/myfolder/file$i"
	echo "Created blank file$i"
	;;
esac
done
