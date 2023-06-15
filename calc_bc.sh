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

function addition() {
	echo "($1+$2)" | bc -l
}

function subtraction() {
	echo "($1-$2)" | bc -l
}

function division() {
	echo "($1/$2)" | bc -l
}

function multiplication() {
	echo "($1*$2)" | bc -l
}

function exponentiation() {
	echo "($1^$2)" | bc -l
}

function sqrt() {
	echo sqrt "($1)" | bc -l
}

case "$operator" in
"+") echo " $x + $y =" $(addition $x $y);;
"-") echo " $x - $y =" $(subtraction $x $y);;
"/") echo " $x / $y =" $(division $x $y);;
"*") echo " $x * $y =" $(multiplication $x $y);;
"^") echo " $x ** $y =" $(exponentiation $x $y);;
"sqrt") echo " $x sqrt $y =" $(sqrt $x);;
*) echo " Wrong parameter operator!"
esac
