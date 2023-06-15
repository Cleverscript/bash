#!/bin/bash
i=0
while [ $i -lt 10 ]
do
echo "iteration $i"
i=$(expr $i + 1)
done


i=1
while read line
do
	echo "$i) $line"
	i=$(( $i + 1 ))
done < /home/toorr2p/cron_date.log
