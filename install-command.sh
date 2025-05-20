#!/bin/bash

USERID=$(id -u)
PACKAGES=("$@")

if [ $USERID -ne 0 ]
then
    echo "Error: please use super user previlages to run the script"
    exit 1
else
    echo "your are run the script with root user."
fi

PACKAGE_INSTALLER(){
    dnf list installed $1
    if [ $? -ne 0 ]
    then
        echo "$1 is not installed, going to install it..."


        dnf install $1 -y
        if [ $? -ne 0 ]
        then
            echo "$1 not installed..."
            exit 1
        else
            echo "$1 is installed...."
        fi

    else
        echo "$1 already installed...."
    fi
}


for package in ${PACKAGES[@]}
do
    PACKAGE_INSTALLER $package
done


