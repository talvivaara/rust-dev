#!/bin/bash

# Get the container ID of the running Postgres container
IMAGE_NAME=$(cat install.sh | grep IMAGE_NAME= |grep -oP '(?<=")[^"]+(?=")')
container=$(docker ps -all | grep postgres | awk '{ print $1 }')

# Check if a container was found
if [ -n "$container" ]; then
  docker stop "$container"
  docker rm "$container"
  echo "Postgres container stopped and removed. Running confirmation:"
  docker ps | grep postgres
  docker image rm $IMAGE_NAME
  echo "Docker image removed"
else
  echo "No running Postgres container found."
  docker ps | grep postgres
fi
