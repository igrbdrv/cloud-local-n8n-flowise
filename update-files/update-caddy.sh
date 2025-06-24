#!/bin/bash

echo "Updating Caddy..."

# Check for required files
if [ ! -f "caddy-docker-compose.yaml" ]; then
  echo "ERROR: File caddy-docker-compose.yaml not found"
  exit 1
fi

# Pull latest image
sudo docker compose -f caddy-docker-compose.yaml pull
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to pull Caddy image"
  exit 1
fi

# Restart container
sudo docker compose -f caddy-docker-compose.yaml up -d
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to restart Caddy"
  exit 1
fi

echo "✅ Caddy successfully updated"
exit 0
