#!/bin/bash

# Change ownership of mounted directory if necessary
if [ "$(id -u)" = "1000" ]; then
  chown -R $USER:$USER /source
fi

exec "$@"