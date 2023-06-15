#!/bin/bash

for i in fhobby.ru ja-sama.ru itswool.ru
do
	ping -c4 -q $i &> /dev/null && echo "$i is available!" || echo "$i is not available!"
done
