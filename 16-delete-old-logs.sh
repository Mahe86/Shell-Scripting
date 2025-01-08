#!/bin/bash

USERID=$(id -u) # Display UserID value, For root user its 0
R="\e[31m" # Print Red color
G="\e[32m" # Print Green color
Y="\e[33m" # Print Yellow color
N="\e[0m" # Print Default White color
LOGS_FOLDER="/var/log/shellscriptlogs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
SOURCE_DIR="/home/ec2-user/app-logs"

mkdir -p $LOGS_FOLDER
echo "Created the $LOGS_FOLDER directory"

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

echo "Started the shell script at $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) # command to find the file names with .log and 14 days old.
echo "files to delete: $FILES_TO_DELETE"

while read -r file
do
echo "Deleting the file: $file"
#rm -rf $file
done <<< $FILES_TO_DELETE

