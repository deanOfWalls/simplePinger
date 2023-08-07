#!/bin/bash

# Start web server in the background
python server.py &

endpoint_urls=(
"https://simple-pinger.onrender.com" # Pinger itself
"https://crud-demo-7igb.onrender.com/readAll"
)

while true; do
  echo "Starting a new iteration at $(date)" # Debug message
  for url in "${endpoint_urls[@]}"; do
    # Send GET request using curl and display the HTTP status code
    http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "HTTP Status Code for $url: $http_code"
    
    # Wait 10s to send the next request, reset to 800 when done
    sleep 800
  done
  echo "Ending iteration at $(date)" # Debug message
done
