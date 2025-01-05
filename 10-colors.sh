#!/bin/bash

USERID=$(id -u) # Display UserID value, For root user its 0
R="\e[31m" # Print Red color
G="\e[32m" # Print Green color
Y="\e[33m" # Print Yellow color


if [ $USERID -ne 0 ]
then
    echo "ERROR : User does not have SUDO access to execute this script"
    exit 1 # Other than 0
fi


VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2..$R FAILURE"
        exit 1
    else
        echo -e "$2..$G SUCCESS"
    fi
}


dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed..So, Installing MYSQL"
    dnf install mysql -y
    VALIDATE $? "MYSQL Installation"
else
    echo -e "$Y MYSQL is already Installed"
fi


dnf list installed git

if [ $? -ne 0 ]
then
    echo "GIT is not installed.So, Installing GIT"
    dnf install git -y
    VALIDATE $? "GIT Installation"
else
    echo -e "$Y GIT is aleady installed"
fi


    