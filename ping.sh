#!/bin/bash
read -p "Please enter host: " HOST
if [ -z "$HOST" ]; then
	echo "\$HOST is null!"
	exit 1
else
	ping -c1 $HOST &> /dev/null
	if [ $? -eq 0 ]; then
		echo "Success ping host $HOST"
	else
		echo "Fail ping host $HOST"
	fi
fi
