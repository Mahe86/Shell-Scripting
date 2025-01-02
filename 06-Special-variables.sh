#!/bin/bash

echo "All variables passed is $@"
echo "Number of variables passed is $#"
echo "script name is $0"
echo "Present working directory is $PWD"
echo "Home directory of current user $HOME"
echo "Which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 &   # &-symbol denotes to run the sleep in backgound
echo "Process id of last command ran: $!"