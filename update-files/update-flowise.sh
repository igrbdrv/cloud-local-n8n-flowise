#!/bin/bash

echo "Updating Flowise..."

# Check for required files
if [ ! -f "flowise-docker-compose.yaml" ]; then
  echo "ERROR: File flowise-docker-compose.yaml not found"
  exit 1
fi

if [ ! -f ".env" ]; then
  echo "ERROR: File .env not found"
  exit 1
fi

# Pull latest image
sudo docker compose -f flowise-docker-compose.yaml pull
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to pull Flowise image"
  exit 1
fi

# Restart container
sudo docker compose -f flowise-docker-compose.yaml up -d
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to restart Flowise"
  exit 1
fi

echo "✅ Flowise successfully updated"
exit 0
