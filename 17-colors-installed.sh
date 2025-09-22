#!/bin/bash

#Installations of mySQL, Nginx, python3

#user

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

uid=$(id -u)

if [ $uid -ne 0 ]; then
    echo "ERROR:: Please run this as a $G ROOT $N User Privileges only"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
    echo "ERROR:: Installation of $2 is $R FAILED $N"
    exit 1
else
    echo "Installation of $2 is $G SUCCESSFUL $N"
fi
}

dnf list installed mysql -y
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mySQL"
else
    echo -e "mySQL is already exists....$Y SKIPPING... $N"
fi
dnf list installed nginx -y
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "Nginx"
else
    echo "Nginx is already exists...$Y SKIPPING... $N"
fi
dnf list installed python3 -y
if [ $? -ne 0 ]; then
    dnf install python -y
    validate $? "python3"
else
    echo "Python is already existing... $Y SKIPPING...$N"
fi