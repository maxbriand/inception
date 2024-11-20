#!/bin/bash

# Start MariaDB temporarily with no networking
service mariadb start

# Wait for MariaDB to fully start
sleep 5

#setup the initial databse and user
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

# # Stop the temporary MariaDB instance
service mariadb stop
exec mysqld_safe

# Keep the container running indefinitely
# tail -f /dev/null
