#!/bin/bash

echo "      Mnml File Encrypter/Decrypter"
echo "Choose your Option"

CHOICE="Encrypt Decrypt Delete"

select OPTIONS in $CHOICE; do
        if [ $RESP = 1 ];
then
        echo "File Encryption has begun"
        read -p "Enter File Name: " FILE
        gpg -c $file
        echo "The file has been encrypted"
else
    if [ $RESP = 2 ];
    then
        echo "File Decryption has begun"
        read -p "Enter File Name: " DECF
        gpg -d $DECF
        echo "The file has been decrypted"
    else
    echo "Deletion of File"
    read -p "Enter File Name: " DELF
    rm -rf $DELF
    echo "The file has been deleted"    
    fi
fi