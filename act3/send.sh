#!/bin/bash

message="test"
key="private"

# Compute HMAC
hmac=$(echo -n "$message" | openssl dgst -sha256 -hmac "$key" | awk '{print $2}')



# Send message and HMAC to receiver
echo "$message|$hmac" > message.txt
echo "Message sent to receiver." 
