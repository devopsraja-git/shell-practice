#!/bin/bash

#Installations of mySQL, Nginx, python3

#user

uid=$(id -u)

if [ $uid -ne 0 ]; then
    echo "ERROR:: Please run this script with ROOT Privileges"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installation of $2 is failed"
        exit 1
    else
        echo "Installation of $2 is SUCCESSFUL"
    fi
}

dnf install mysql -y
validate $? "mySQL"

dnf install nginx -y
validate $? "Nginx"

dnf install python -y
validate $? "python"