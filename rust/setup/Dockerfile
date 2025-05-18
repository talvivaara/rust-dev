FROM rust:latest

# Create a non-root user with UID/GID matching your host (optional for volume permissions)
ARG USERNAME=rustdev
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $USERNAME \
    && useradd -m -u $UID -g $GID -s /bin/bash $USERNAME 


# Copy custom entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /source
USER $USERNAME