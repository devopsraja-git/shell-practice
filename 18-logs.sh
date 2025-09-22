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
    echo -e "ERROR:: Installation of $2 is $R FAILED $N" &>> $LOG_FILE
    exit 1
else
    echo -e "Installation of $2 is $G SUCCESSFUL $N" &>> $LOG_FILE
fi
}

dnf list installed mysql -y &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    validate $? "mySQL"
else
    echo -e "mySQL is already exists....$Y SKIPPING... $N"
fi
dnf list installed nginx -y &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    validate $? "Nginx"
else
    echo -e "Nginx is already exists...$Y SKIPPING... $N"
fi
dnf list installed python3 -y &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python -y &>>$LOG_FILE
    validate $? "python3"
else
    echo -e "Python is already existing... $Y SKIPPING...$N"
fi