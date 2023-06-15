#!/bin/bash

set -x

SCRIPT_PATH="$1"
#SCRIPT_PATH="/home/$(whoami)/test.sh"
CURR_PATH="$(pwd)"
CLEAR_PATH="/home/$(whoami)/CLEAR/"

# check path file
if [ -z $SCRIPT_PATH ]; then
    echo "Warning - path is empty!"
    exit 1
fi

# create CLEAR folder if is not exist
if [ ! -d $CLEAR_PATH ]; then
    mkdir $CLEAR_PATH
fi

# If $FILE_PATH current folder - replace to absolute path
if echo $SCRIPTE_PATH | grep -q '^\.\/'; then
    SCRIPT_PATH="$CURR_PATH/$(echo $PACKAGE_PATH | sed 's/\.\///')"
elif ! echo $SCRIPT_PATH | grep -q '^\/'; then
    SCRIPT_PATH="$CURR_PATH/$SCRIPT_PATH"
fi

if [ -f $SCRIPT_PATH ]; then

	FILE_NAME=$(basename -a $SCRIPT_PATH)
    echo "#!/bin/bash" > "$CLEAR_PATH$FILE_NAME"
    while read line
    do
	    echo $line | sed '/^#/ d' >> "$CLEAR_PATH$FILE_NAME"
    done < "$SCRIPT_PATH"
    
else
    echo "Warning - file $SCRIPT_PATH is not exist!"
    exit 1
fi


