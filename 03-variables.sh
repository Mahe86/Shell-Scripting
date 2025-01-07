#!/bin/bash

echo "Please enter your username"
read USERNAME # read command will read the value of the entered command.
echo "username entered: $USERNAME"
echo "Please enter your password"
read -s PASSWORD # -s will not display the value entered.
echo "password entered: $PASSWORD" # we should not disply the password. This is just for testing