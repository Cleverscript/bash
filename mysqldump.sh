#!/bin/bash

#set -x

# check init mysql service
STATUS=$(systemctl status mysql | grep Active | awk '{print $2}')
LOG="/var/log/mysqldumpSh.log"
BACKPATH="/home/devops/BACKUPS/"
SQLFILE=${BACKPATH}backup_all_db_$(date +"%d.%m.%Y_%H%M%S").sql

if [ ! -d $BACKPATH ]; then
    mkdir $BACKPATH
fi

if [ $STATUS=='active' ]; then
    mysqldump -u remote -pcFa7sH8YHq! --all-databases > $SQLFILE 2>>$LOG
    echo "[$(date +"%d.%m.%Y %H:%M:%S")] Success create backup all databases mysql server ${SQLFILE}" >> $LOG
    find $BACKPATH -type f -name "*.sql" -mtime +7 -exec rm -f {} \;
    exit 0
else
    echo "[$(date +"%d.%m.%Y %H:%M:%S")] Service mysql is not active (status ${STATUS})" >> $LOG
    exit 1
fi