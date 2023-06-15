#!/bin/bash
read -p "Enter file name: " file

if [! -e "$file" ]; then
	echo "File is not exist path $file"
	exit 1
fi

i=1
while read line
do
	echo "line $i: $line"
	i=$(($i + 1))
done < "$file"
