#!/bin/bash
i=0
read -p "Enter file name: " fileName

if [ ! -z "$fileName" ]; then
	while [ $i -le 10 ]; do
		filePath="/tmp/${fileName}_${i}.tmp"
		echo $filePath
		#exit
		if [ -f $filePath ]; then
			echo "Warning file $filePath is exist"
		else
			mkdir $filePath
			if [ $? -eq 0 ]; then
				echo "Success create file $filePath"
			else
				echo "Warning fail create file $filePath"
			fi
		fi
		i=$(expr $i + 1)
	done
else
	echo "Error file name is empty!"
fi	

