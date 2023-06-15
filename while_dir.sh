#!/bin/bash
i=0
rm -rf /tmp/directory*
while [ $i -le 6 ]
do 
	dir="/tmp/directory-`date +%Y%m%d`_`date +%H%M`"
	if [ ! -d $dir ]; then
		mkdir $dir 2> /tmp/copyerror.log
		sleep 60 #sorry no time to wait 7min :)
		let i++
	else
		continue
	fi
done
