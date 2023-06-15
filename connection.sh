#!/bin/bash
read -p "Please enter host: " HOST
if [ -z "$HOST" ]; then
	echo "\$HOST is null!"
	exit 1
else
	#check ping host
	rm -f /tmp/ping.log
	rm -f /tmp/connection.log
	ping -q -c10 $HOST &>> /tmp/ping.log
	if [ $? -eq 0 ]; then
		echo "Success ping host $HOST"

		#check resolve ip
		host $HOST | grep "has address" | awk '{print $4}' | head -1 &>> /tmp/connection.log
		if [ $? -ne 0 ]; then
			echo "Fial host $HOST  resolve IP addr"
			exit $?
		fi

		echo "Success host $HOST resolve IP: "
		tail /tmp/connection.log
		tail -3 /tmp/ping.log

		exit
	else
		echo "Fail ping host $HOST"
		exit $?
	fi
fi
