#!/bin/bash

if [ -d etc/passwd ];
then
        echo "Yes it exists"
else
        echo "The Directory does not exist"
fi