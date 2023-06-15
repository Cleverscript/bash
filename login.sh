#!/bin/bash
read -p "Please enter your login: " LOGIN
if [ "$LOGIN" == toorr2p ]; then
	read -s -p "Please enter your passw: " PASSW
	if [ "$PASSW" == 123123 ]; then
		echo "Hellow $LOGIN, you auth!"
	else
		echo "Wrong password!"
		exit 1
	fi	
else
	echo "Invalid login!"
	exit 1
fi
