#!/bin/bash
read -p "Please enter thre number params [1 2 3]: " var1 var2 var3

#echo $var1 $var2 $var3

#to int
let var1=$var1
let var2=$var2
let var3=$var3

#echo $var1 $var2 $var3

#check input params for null
if [ -z $var1 ] || [ -z $var2 ] || [ -z $var3 ]; then
	echo "Error: count params should be 3!"
	exit 1
fi

if [ $var1 -gt $var2 ] && [ $var1 -gt $var3 ]; then
	echo "var1 is large!"
elif [ $var2 -gt $var1 ] && [ $var2 -gt $var3 ]; then
	echo "var2 is large!"
else
	echo "var3 is large!"
fi

echo "(vardump: $var1 $var2 $var3)"
