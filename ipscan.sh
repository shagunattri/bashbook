#!/bin/bash

if [ "$1" == "" ]
then 
echo "Your Forgot to provide the argument!"
echo "Syntax: ./ipscan.sh <ip>"

else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi