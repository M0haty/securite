#!/bin/bash


#Creating the all read directory PUBKEYS
sudo mkdir /home/PUBKEYS
sudo chmod a+r-w  /home/PUBKEYS




while read  user
do

#Adding user
sudo useradd -m $user

#Creating the user only read directory KEYS
sudo mkdir /home/$user/KEYS
sudo chmod a-rw /home/$user/KEYS
sudo chmod u+r /home/$user/KEYS

#Creating a sub directory to hold the public key of the user
sudo mkdir /home/PUBKEYS/$user

#Generating the private key and public key and puting them in their adequat places
sudo openssl genrsa -out /home/$user/KEYS/private-key.pem 3072
sudo openssl rsa -in /home/$user/KEYS/private-key.pem -pubout -out /home/PUBKEYS/$user/public-key.pem


done < $1
