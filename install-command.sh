#!/bin/bash

USERID=$(id -u)
PACKAGES=("$@")

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
SCRIPT_RUNTIME=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$SCRIPT_RUNTIME.log"

mkdir -p $LOGS_FOLDER


if [ $USERID -ne 0 ]
then
    echo -e "${RED}Error: please use super user previlages to run the script ${RESET}" &>> $LOG_FILE
    exit 1
else
    echo -e "${GREEN}your are run the script with root user.${RESET}" &>> $LOG_FILE
fi

PACKAGE_INSTALLER(){
    dnf list installed $1 &>> $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$1 is not installed, going to install it...${GREEN}Installing...${RESET}" &>> $LOG_FILE


        dnf install $1 -y &>> $LOG_FILE
        if [ $? -ne 0 ]
        then
            echo -e "${RED}$1 not installed...${RESET}" &>> $LOG_FILE
            exit 1
        else
            echo -e "$1 is ${GREEN}installed....${RESET}" &>> $LOG_FILE
        fi

    else
        echo -e "$1 already ${GREEN}installed....${RESET}" &>> $LOG_FILE
    fi
}


for package in ${PACKAGES[@]}
do
    PACKAGE_INSTALLER $package
done


