#!/bin/bash

#set -x

while read line
do
	SL=$(awk 'BEGIN {srand(); print int(rand()*100)}')
	echo "[$SL] - $line"
	sleep $SL
done<<<"$(fortune)"

exit 0

while :
do
	SL=$(awk 'BEGIN {srand(); print int(rand()*100)}')
	echo "[$SL] - $(fortune)"
	sleep $SL
done
