FROM ghcr.io/atuinsh/atuin:latest

# Copy the config directory
COPY config /config

# Copy the entrypoint.sh script
COPY entrypoint.sh /entrypoint.sh

# Execute the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]