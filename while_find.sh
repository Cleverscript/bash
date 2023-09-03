#!/bin/bash

# Listing all files directory 

DIR="/usr"

find $DIR -type f |
while read filepath
do
    if [ -x "$filepath" ]
    then
        echo "$filepath"
    else
        continue
    fi
done