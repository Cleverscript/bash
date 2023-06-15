#!/bin/bash
i=1
rm -f /tmp/fortune.txt && touch /tmp/fortune.txt
while (( $i < 11 ))
do
	fortune=$(fortune) 
       	echo "$i $fortune" >> /tmp/fortune.txt
	let i++
done

cat /tmp/fortune.txt


