# Start from the Debian Buster image as the base
FROM debian:buster

# Install NGINX and OpenSSL
RUN apt-get update && \
  apt-get install -y nginx openssl gettext-base && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Copy the NGINX configuration file
COPY ./conf/default.template /etc/nginx/sites-available/default.template

# Copy the entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the ports for HTTPS
EXPOSE 443

# Use the entrypoint script to start NGINX
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
