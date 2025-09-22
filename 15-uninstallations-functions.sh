#!/bin/bash

uid=$(id -u)

if [ $uid -ne 0 ]; then
    echo "ERROR:: Please run this script as a ROOT User Privileges"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: $2 is not REMOVED"
        exit 1
    else
        echo "$2 is REMOVED"
    fi
}

dnf remove mysql -y
validate $? "mySQL"
dnf remove nginx -y
validate $? "Nginx"
dnf remove python3 -y
validate $? "python"
