#!/bin/bash

for f in `find /etc/ -maxdepth 1 -type f`
do	
	p=$(wc -L $f)
	echo $(basename -a $p) 2> /dev/null
done
