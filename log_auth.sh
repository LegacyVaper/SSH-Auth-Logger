#!/bin/bash

# Set your Discord webhook URL
WEBHOOK_URL="https://discord.com/api/webhooks/your_webhook_url_here"

# Get the IP address of the client
IP=$(echo $SSH_CONNECTION | awk '{print $1}')

# Check if authentication was successful or failed
if [ "$SSH_AUTH_SUCCESS" == "1" ]; then
  # Get the username of the authenticated user
  USERNAME=$(whoami)

  # Get the current date and time
  DATE=$(date "+%Y-%m-%d")
  TIME=$(date "+%H:%M:%S")

  # Log the successful authentication event
  MESSAGE="Successful SSH login by user '$USERNAME' from IP: $IP on $DATE at $TIME"
else
  # Log the failed authentication event
  MESSAGE="Failed SSH login attempt from IP: $IP"
fi

# Send the log message to the Discord webhook
curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$MESSAGE\"}" $WEBHOOK_URL
