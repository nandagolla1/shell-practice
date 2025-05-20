#!/bin/bash

USERID=$(id -u)
PACKAGES=("$@")

if [ USERID -ne 0 ]
then
    echo "Error: please use super user previlages to run the script"
    exit 1
else
    echo "your are run the script with root user."
fi

PACKAGE-INSTALLER(){
    dnf list installed $1
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
}


for package in ${PACKAGES[@]}
do
    PACKAGE-INSTALLER $package
done


