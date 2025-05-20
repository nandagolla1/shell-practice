#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]
then
    echo "Error: please use super user previlages to run the script"
    exit 1
else
    echo "your are run the script with root user."
fi



dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it..."


    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql not installed..."
        exit 1
    else
        echo "mysql is installed...."
    fi
    
else
    echo "already installed...."
fi



