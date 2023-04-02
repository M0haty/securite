#!/bin/bash

key="private"

# Wait for message

echo "Waiting for message from sender..."
while [ ! -f message.txt ]
do
  sleep 1
done

# Read info

message=$(cat message.txt | cut -d '|' -f 1)
hmac=$(cat message.txt | cut -d '|' -f 2)

# Verify authentecity

if [ "$hmac" == "$(echo -n "$message" | openssl dgst -sha256 -hmac "$key" | awk '{print $2}')" ]; then
  echo "Message received successfully! Message: $message"
else
  echo "Message verification failed. HMAC mismatch!"
fi
rm message.txt
