#!/bin/bash
read -p "Please enter parameter one: " x
read -p "Please enter parameter two: " y
read -p "Please enter operator: " operator

#echo $operator

if [ "$operator"=/ ]; then
	if [ "$y" -le 0 ]; then
		echo "Error: can\`t divide by zero"
		exit 1
	fi
fi

case "$operator" in
"+") echo " $x + $y =" $(expr $x + $y);;
"-") echo " $x - $y =" $(expr $x - $y);;
"/") echo " $x / $y =" $(expr $x / $y);;
"*") echo " $x * $y =" $(expr $x \* $y);;
"**") let a=$x**$y; echo " $x ** $y = $a";;
*) echo " Wrong parameter operator!"
esac
