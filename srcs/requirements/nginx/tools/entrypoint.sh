#!/bin/sh

# Setup SSL certificates
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -subj "/C=FR/L=Paris/O=42/OU=student/CN=${DOMAIN_NAME}/"

# Substitute environment variables into nginx.conf.template
envsubst '$DOMAIN_NAME' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default

# Start NGINX in the foreground
exec nginx -g 'daemon off;'
