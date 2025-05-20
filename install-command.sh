#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]
then
    echo "Error: please use super user previlages to run the script"
    exit 1
else
    echo "your are run the script with root user."
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "mysql not installing..."
    exit 1
else
    echo "mysql is installing...."
fi