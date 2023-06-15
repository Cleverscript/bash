#!/bin/bash
read -p "Enter birth year: " birth

if [ -z $birth ]; then
	echo "Error year birth is null!"
else
	echo $(expr `date +%Y` - $birth)
fi
