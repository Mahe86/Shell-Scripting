#1/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
    echo "User is a root user. Installing MYSQL application"
else
    echo "User is not a root user".So, exiting the installation.
fi