# Use the official MariaDB image as the base
FROM mariadb:latest

# Environment variables for database credentials, configured through the .env file
# These are not hardcoded here; Docker Compose will pass the values during runtime.
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Expose the default MariaDB port
EXPOSE 3306

# The default command to run MariaDB
CMD ["mysqld"]
