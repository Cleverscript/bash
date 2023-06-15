#!/bin/bash
today=$(date +'%d-%m')
if [ $today = 31-12 ]; then
    echo "Happy new year!"
elif [ $today = 08-03 ]; then
    echo "Happy international womens day!"
elif [ $today = 11-05 ]; then
     echo "Happy DPR day!"
else
    echo "To date $today"
fi