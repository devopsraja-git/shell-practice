#!/bin/bash

#Installations of mySQL, Nginx, python3

#user

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
    echo -e "ERROR:: Please run this as a $G ROOT $N User Privileges only"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
    echo -e "ERROR:: Installation of $2 is $R FAILED $N"
    exit 1
else
    echo -e "Installation of $2 is $G SUCCESSFUL $N"
fi
}

for package in $@
do
    echo "Package is: $package"
done