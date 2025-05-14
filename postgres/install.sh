#!/bin/bash

# Set environment variables for PostgreSQL
POSTGRES_USER="admin"
POSTGRES_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
CONTAINER_NAME="postgresql"
VOLUME_NAME="files"
IMAGE_NAME="rust-env-postgres"

# Check if container is already running
if docker ps | grep -q "$CONTAINER_NAME"; then
  echo "A PostgreSQL container is already running. Exiting script."
  exit 0
fi

# Build the custom image if not present
if ! docker image ls | grep -q "$IMAGE_NAME"; then
  echo "Building custom PostgreSQL image..."
  docker build -t "$IMAGE_NAME" .
fi

# Start the container
echo "Starting PostgreSQL container..."
docker run -itd \
  --name "$CONTAINER_NAME" \
  -e POSTGRES_USER="$POSTGRES_USER" \
  -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  -p 5432:5432 \
  -v "$VOLUME_NAME":/var/lib/postgresql/data \
  "$IMAGE_NAME"

# Save credentials and display status
echo "$POSTGRES_USER $POSTGRES_PASSWORD" > files/secret
echo "PostgreSQL container is now running:"
echo "Database user: $POSTGRES_USER"
echo "Password saved to: files/secret"
echo "Data volume: sudo ls -la /var/lib/docker/volumes/$VOLUME_NAME/_data"
docker ps | grep "$CONTAINER_NAME"
