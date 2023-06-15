#!/bin/bash

#set -x

echo $(df -h | grep "/dev/mapper" | awk '{print $5}' | echo "100-$(sed 's/%//')" | bc -l)
