#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

uid=$(id -u)


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at $(date)"

if [ $uid -ne 0 ]; then
    echo -e "ERROR:: Please run this as a $G ROOT $N cart Privileges only"
    exit 1
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days $N]"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi