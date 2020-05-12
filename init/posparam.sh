#!/bin/bash

#Does not work for Arch use visudo bruh!
echo "Script Executing: $0"
echo "New user to be added: $1"

adduser --home /$1 $1