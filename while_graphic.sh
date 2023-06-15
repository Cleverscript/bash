#!/bin/bash

while true
do	
	echo "How do you want to ask a question?"
	echo
	cat << options
daemon
bunny
tux
kitty
vader-koala
options
	echo
	read -p "Make your choise: " option

	if [ $option == "quit" ]; then
		echo "Quit"
		break
	else	
		fortune | cowsay -f $option
	fi
done
