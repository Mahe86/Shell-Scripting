#!/bin/bash

USERID=$(id -u) # Display UserID value, For root user its 0
R="\e[31m" # Print Red color
G="\e[32m" # Print Green color
Y="\e[33m" # Print Yellow color
N="\e[0m" # Print Default White color
LOGS_FOLDER="/var/logs/shellscriptlogs"
LOG_FILE=$(echo $0 | cut -d "-" -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


mkdir -p $LOGS_FOLDER
echo "Created the $LOGS_FOLDER directory"
echo "Started the shell script at $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR : User does not have SUDO access to execute this script"
    exit 1 # Other than 0
fi


VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2..$R FAILURE $N"
        exit 1
    else
        echo -e "$2..$G SUCCESS $N"
    fi
}


dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed..So, Installing MYSQL"
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "MYSQL Installation"
else
    echo -e "$Y MYSQL is already Installed $N"
fi


dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "GIT is not installed.So, Installing GIT"
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "GIT Installation"
else
    echo -e "$Y GIT is aleady installed $N"
fi


    