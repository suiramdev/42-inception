FROM debian:buster

# Install MariaDB
RUN apt-get update \
  && apt-get install -y mariadb-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Copy the configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the port for MariaDB
EXPOSE 3306

# Use the entrypoint script to start MariaDB
CMD ["/usr/local/bin/entrypoint.sh"]
