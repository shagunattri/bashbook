#!/bin/bash

echo "      Mnml File Encrypter/Decrypter      "
echo "      Choose your Option"

echo -n "Encrypt/Decrypt/Delete $CHOICE "

case $CHOICE in


    1)
        echo -n "Encrypting file"
        read -p "Enter file Name: " FILE
        echo "The file has been encrypted"
        gpg -c $file
        ;;

    2)
        echo -n "Decrypting file"
        read -p "Enter file Name: " FILE
        gpg -d $file
        echo "The file has been decrypted"
        ;;
    3)
        echo -n "Deleting file"
        read -p "Enter file Name: " FILE
        rm -rf $file
        echo "File Deleted!"
        ;;
esac


















# select OPTIONS in $CHOICE; do
#         if [ $RESP = 1 ];
#         then
#         echo "File Encryption has begun"
#         read -p "Enter File Name: " FILE
#         gpg -c $file
#         echo "The file has been encrypted"
#     else
#         if [ $RESP = 2 ];
#         then
#         echo "File Decryption has begun"
#         read -p "Enter File Name: " DECF
#         gpg -d $DECF
#         echo "The file has been decrypted"
#     else
#     echo "Deletion of File"
#     read -p "Enter File Name: " DELF
#     rm -rf $DELF
#     echo "The file has been deleted"    
#     fi
# fi