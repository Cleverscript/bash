#!/bin/bash

until cat /tmp/until_exit.txt
do

	echo "Wait exist file!"
	sleep 10

done
