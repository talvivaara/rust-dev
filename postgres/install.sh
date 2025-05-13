#!/bin/bash

# Set environment variables for PostgreSQL
POSTGRES_USER="admin"
POSTGRES_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
CONTAINER_NAME="postgresql"
VOLUME_NAME="files"

# Lets check if postgres is already running
if docker ps | grep postgres; then
  echo "A A PostgreSQL container is already running. Exiting script."
  exit 0
fi

# Pull the latest PostgreSQL image
echo "Pulling the latest PostgreSQL image..."
docker pull postgres

# Run the PostgreSQL container
echo "Starting PostgreSQL container..."
docker run -itd \
  --name "$CONTAINER_NAME" \
  -e POSTGRES_USER="$POSTGRES_USER" \
  -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  -p 5432:5432 \
  -v "$VOLUME_NAME":/var/lib/postgresql/data \
  postgres

# Confirm the container is running
echo "PostgreSQL container is now running:"
echo "Database user is $POSTGRES_USER and password is $POSTGRES_PASSWORD" && echo "$POSTGRES_USER $POSTGRES_PASSWORD" > files/secret
echo "Data is located here: sudo ls -la /var/lib/docker/volumes/$VOLUME_NAME/_data"
docker ps | grep "$CONTAINER_NAME"