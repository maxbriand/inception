#!/bin/bash

# Start MariaDB temporarily with no networking
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to fully start
sleep 5

#setup the initial databse and user
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# mysql -e "FLUSH PRIVILEGE;"

# # Stop the temporary MariaDB instance
# mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# exec mysqld_safe

# Keep the container running indefinitely
# tail -f /dev/null
