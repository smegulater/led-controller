#!/bin/bash

# LED Control Project Deployment Script

# Read the configuration variables from the config file
source "$(dirname "$0")/config/projectConfig.cfg"

# Build your project (if needed)
echo "Building the project..."
# Add the commands to build your project here

# Deploy to the Raspberry Pi
echo "Deploying to the Raspberry Pi..."
rsync -avz --delete ./ $PI_USERNAME@$PI_HOST:$PI_PATH

# Restart services on the Raspberry Pi (e.g., LED Python service and web server)
echo "Restarting services on the Raspberry Pi..."
ssh $PI_USERNAME@$PI_HOST "sudo systemctl restart led_service && sudo systemctl restart led_web_server"

echo "Deployment completed!"
