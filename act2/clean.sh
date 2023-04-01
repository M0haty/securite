#!/bin/bash
while read user 
do

#removing the users and their home directories and thir pub keys 
sudo deluser --remove-home $user
sudo rm -fr /home/PUBKEYS/$user

done < $1
if [ -e /home/PUBKEYS ]; then
  echo "deleting /home/PUBKEYS"
  rm -fr /home/PUBKEYS
fi
