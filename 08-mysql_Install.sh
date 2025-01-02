#1/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
    echo "User is a root user"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MYSQL..SUCCESS"
    else
        echo "Installing MYSQL..FAILURE"
        exit 1
    fi
else
    echo "User is not a root user"
    exit 1  # other than 0
fi