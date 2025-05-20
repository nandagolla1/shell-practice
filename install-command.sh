#!/bin/bash

USERID=$(id -u)
PACKAGES=("$@")
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "${RED}Error: please use super user previlages to run the script ${RESET}"
    exit 1
else
    echo -e "${GREEN}your are run the script with root user.${RESET}"
fi

PACKAGE_INSTALLER(){
    dnf list installed $1
    if [ $? -ne 0 ]
    then
        echo -e "$1 is not installed, going to install it...${GREEN}Installing...${RESET}"


        dnf install $1 -y
        if [ $? -ne 0 ]
        then
            echo -e "${RED}$1 not installed...${RESET}"
            exit 1
        else
            echo -e "$1 is ${GREEN}installed....${RESET}"
        fi

    else
        echo -e "$1 already ${GREEN}installed....${RESET}"
    fi
}


for package in ${PACKAGES[@]}
do
    PACKAGE_INSTALLER $package
done


