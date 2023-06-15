#!/bin/bash
num=0
while [ $num -lt 10 ]; do
	if [ $(($num%2)) -eq 0 ]; then
	       	echo "$num ${fortune}"
	fi
	let num++
done
