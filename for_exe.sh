#!/bin/bash
set -x
SLOGS="/var/log"
SPATH="/home/toorr2p"
SYSNAME="$(uname -n)_$(date +'%d.%m.%Y')" ; sudo find $SPATH -type f | xargs -d '\n' sha1sum > ${SLOGS}/${SYSNAME}_baseline.log 2>${SLOGS}/${SYSNAME}_error.log