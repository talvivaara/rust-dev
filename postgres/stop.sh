#!/bin/bash

# Get the container ID of the running Postgres container
container=$(docker ps | grep postgres | awk '{ print $1 }')

# Check if a container was found
if [ -n "$container" ]; then
  docker stop "$container"
  docker rm "$container"
  echo "Postgres container stopped and removed. Running confirmation:"
else
  echo "No running Postgres container found."
fi

# Show any remaining Postgres containers (should be none)
docker ps | grep postgres