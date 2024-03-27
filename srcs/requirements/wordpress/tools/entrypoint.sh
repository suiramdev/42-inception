#!/bin/bash

# Install WordPress if it is not already installed
if [ ! -d ./wordpress ]; then
  echo "Installing WordPress..."
  mkdir -p wordpress
  cd wordpress
  wp core download --allow-root

  sleep 5
  wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
  sleep 5

  wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
  wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --role=editor --porcelain --allow-root
  wp theme install neve --activate --allow-root
  echo "WordPress has been installed."
fi

# Create the directory for the PHP-FPM socket
mkdir -p /run/php

# Start the PHP-FPM service in the foreground
exec /usr/sbin/php-fpm7.3 -F
