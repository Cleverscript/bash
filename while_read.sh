#!/bin/bash

# endless cycle

while :
do
    read -p "Enter your email: " email
    if [ ! -z "$email" ]; then
        echo "Your name $email!"
        break
    fi
done

