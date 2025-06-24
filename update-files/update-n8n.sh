#!/bin/bash

echo "Updating n8n..."

# Check for required files
if [ ! -f "n8n-docker-compose.yaml" ]; then
  echo "ERROR: File n8n-docker-compose.yaml not found"
  exit 1
fi

if [ ! -f ".env" ]; then
  echo "ERROR: File .env not found"
  exit 1
fi

# Pull latest image
sudo docker compose -f n8n-docker-compose.yaml pull
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to pull n8n image"
  exit 1
fi

# Restart container
sudo docker compose -f n8n-docker-compose.yaml up -d
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to restart n8n"
  exit 1
fi

echo "✅ n8n successfully updated"
exit 0
