#!/bin/bash

#check count params
if [ ! $# = 2 ]
then
	echo "Error! Wrong parameters, showld be 2!"
	exit 1
fi

#check isset dir param 1
if [ ! -d "$1" ]
then
	
	echo "Error! Dir $1 is not exist!"
	exit 1
fi

#check isset dir param 1
if [ ! -d "$2" ]
then
	echo "Error! Dir $2 is not exist!"
	exit 1
fi

#copy & remove dir
if cp -r "$1" "$2" && rm -rf "$1"
then
	echo "Success! Copy dir $1 to $2 complete!"
	exit 0
else
	echo "Error! Fail copy dir $1 to $2"
	exit 1
fi	