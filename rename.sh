#!/bin/bash

#check count params
if [ ! $# = 2 ]; then
    echo "Error wrong parameters, should be 2!"
    exit 1
fi

#check exist file param 1
if [ ! -e "$1" ]; then
    echo "Error! File $1 is not exist!"
    exit 1
fi

#check type file param 1
if [ ! -f "$1" ]; then
    echo "Error! The first parameter does not point to a file!"
    exit 1
fi

if cp "$1" "$2" && rm -f "$1"; then
    echo "Success! File $1 copied to $2"
    exit 0
else
    echo "Error! Fail copy file $1 to $2"
fi
