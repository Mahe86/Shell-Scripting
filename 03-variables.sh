#!/bin/bash

echo "Please enter your username"
read USERNAME
echo "username entered: $USERNAME"
echo "Please enter your password"
read -s PASSWORD # -s will not display the value entered.
echo "password entered: $PASSWORD" # we should not disply the password. This is just for testing