FROM debian:buster

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update \
  && apt-get install -y php-fpm php-mysql wget gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install WordPress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration file
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Copy the entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the port for PHP-FPM
EXPOSE 9000

# Use the entrypoint script to start PHP-FPM
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
