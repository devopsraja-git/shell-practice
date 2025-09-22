#!/bin/bash

#Install mySQL client in the server

#first check if user is root or not

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this as a ROOT User Privileges"
fi

# If the user is ROOT then proceed to install mySQL client
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installation of mySQL is failed"
else
    echo "Installation of mySQL is SUCCESSFUL"
fi