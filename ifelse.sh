#!/bin/bash

read -p "Enter Shagun's Github Username: " UNAME

if [ "$UNAME" = "shagunattri"];
then
        echo "Welcome back Shagun"
else
        echo "Invalid username,Get it right boi!!"
fi