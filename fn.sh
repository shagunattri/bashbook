#!/bin/bash

function test_tmp(){
if [ -d /tmp ];
then
        echo "Directory exists"
else
        echo "Directory does not exist"
fi
# Calling function within another function 
test_usr
}

function test_usr(){
if [ -d /usr ];
then
        echo "Directory exists"
else
        echo "Directory does not exist"
fi
}

test_tmp