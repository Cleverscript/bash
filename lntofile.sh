#!/bin/bash

#set -x

PACKAGE_PATH="$1"
CURR_PATH="$(pwd)"

# check path file/dir
if [ -z $PACKAGE_PATH ]; then
    echo "Warning - path is empty!"
    exit 1
fi

# check symlink
if [ -L $PACKAGE_PATH ]; then
    if [ -e $PACKAGE_PATH ]; then
        ORIG_FILE=$(readlink $PACKAGE_PATH)
        unlink $PACKAGE_PATH
        cp $ORIG_FILE $PACKAGE_PATH
        echo "Convert sumlink to file ${PACKAGE_PATH}"
        exit 0
    else
        echo "Warning broken link to file $(readlink $PACKAGE_PATH)"
        exit 1
    fi
fi