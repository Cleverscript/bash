#!/bin/bash

set -x

function init()
{
	UNPACK_PATH_NOTE="Alert!"
	return=$1
	echo $return
}

result=$(init $1)

if [ $result -eq 0 ]; then
	echo "Some alarm - good!"
else
	echo "Some alarm - $UNPACK_PATH_NOTE"
fi

