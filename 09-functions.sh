#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR : User does not have SUDO access to execute this script"
    exit 1 # Other than 0
fi


VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2..FAILURE"
        exit 1
    else
        echo "$2..SUCCESS"
    fi
}


dnf list installed mysql

if [ $? ne 0 ]
then
    echo "MYSQL is not installed..So, Installing MYSQL"
    dnf install mysql -y
    VALIDATE $? "MYSQL Installation"
else
    echo "MYSQL is already Installed"
fi


dnf list installed git

if [ $? ne 0]
then
    echo "GIT is not installed.So, Installing GIT"
    dnf install git -y
    VALIDATE $? "GIT Installation"
else
    echo "GIT is aleady installed"
fi


    