#!/bin/bash
#set -x 

function unPackg()
{
    local file_path=$1
    local unpack_path=$2
    local return=0

    # check empty file path
    if [ -z $file_path ]; then
        return=2
    fi

    # If $FILE_PATH current folder - replace to absolute path
    if echo $file_path | grep -q '^\.\/'; then
        file_path=$(pwd)/$(echo $file_path | sed 's/\.\///')
    fi

    # If $UNPACK_PATH current folder or empty $2 - replace to absolute path
    if echo $unpack_path | grep -q '^\.\/' || [ -z $unpack_path ]; then
        unpack_path=$(pwd)
        # I hat to spoil the global scope :)
        UNPACK_PATH_NOTE=$(pwd)
    fi

    # Check exist package file
    if [ ! -f $file_path ]; then
        return=3
    fi

    # GZ
    if echo $file_path | grep -q '.gz'; then
        gzip -d $file_path && return=0 || return=1
    # BZ2
    elif echo $file_path | grep -q '.bz2'; then
        bunzip2 $file_path && return=0 || return=1
    # LZMA
    elif echo $file_path | grep -q '.lzma'; then
        unlzma $file_path && return=0 || return=1
    # ZIP
    elif echo $file_path | grep -q '.zip'; then
        if type unzip &>/dev/null; then
           unzip -o $file_path -d $unpack_path &> "$unpack_path/unzip.log" && return=0 || return=1
        else
            return=4
        fi
    # TAR
    elif echo $file_path | grep -q '.tar'; then
        if type tar &>/dev/null; then
           tar -xf $file_path -C $unpack_path &>"$unpack_path/tar.log" && return=0 || return=1
        else
            return=5
        fi
    fi

    echo $return
}

#init function unpackg
read -p "Enter archive file path: " FILE_PATH
read -p "Enter unpackage path: " UNPACK_PATH

result=$(unPackg $FILE_PATH $UNPACK_PATH)

if [ $result == 0 ]; then
    echo "Success unpackage $FILE_PATH"
elif [ $result == 2 ]; then
    echo "Warning - file path empty!"
elif [ $result == 3 ]; then
    echo "Warning - file not exist $FILE_PATH"
elif [ $result == 4 ]; then
    echo "Warning - command \"unzip\" is not exist!"
elif [ $result == 5 ]; then
    echo "Warning - command \"tar\" is not exist!"
else
    echo "Fail unpackage $FILE_PATH"
fi
