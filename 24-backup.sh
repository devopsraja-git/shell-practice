#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

uid=$(id -u)

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
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
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days$N]"
    exit 1
}

    if [ $# -lt 2 ]; then
        USAGE
    fi
#check source directory exists or not
        if [ ! -d $SOURCE_DIR ]; then
            echo -e "$R Source $SOURCE_DIR doesnot exist $N"
            exit 1
        fi
#check destination directory exists or not
        if [ ! -d $DEST_DIR ]; then
            echo -e "$R Destination $DEST_DIR doesnot exist $N"
            exit 1
        fi

#find the files to be archived and deleted
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)


if [ ! -z "${FILES}" ]; then
    echo "Files found: $FILES" #Start arvhiving the files
    TIME_STAMP=$(date +%F)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIME_STAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    echo "$FILES" | zip  -@ -j "$ZIP_FILE_NAME" #give -j for not storing with full path"

    if [ -f $ZIP_FILE_NAME ]; then
        echo -e "Archival...$G SUCCESS $N"

        while IFS= read -r filepath
        do
        echo "Deleting the file: $filepath"
        rm -rf $filepath
        echo "Deleted the file: $filepath"
        done <<< $FILES
    else
        echo -e "Archival...$R FAILED $N"
        exit 1
    fi

else
    echo -e "No Files to archive  $Y SKIPPING.. $N"
fi

