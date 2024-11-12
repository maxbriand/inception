# #Use the lastest debian version
FROM debian:bullseye

#Update apt
RUN apt upgrade -y
RUN apt update -y
RUN apt install mariadb-server -y

# Remove useless packages
RUN rm -rf /var/lib/apt/lists/*

#update Mariadb serv conf
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

#copy database script in my container AND use the database creation script
COPY tools/script.sh /run/script.sh
RUN chmod +x /run/script.sh
CMD ["/run/script.sh"]


# # The default command to run MariaDB
# CMD ["mysqld"]

# Set up environment variables for MariaDB configuration
# ENV MYSQL_ROOT_PASSWORD=rootpassword  # Change to a secure password
# ENV MYSQL_DATABASE=mydatabase         # Optional: name of the database
# ENV MYSQL_USER=myuser                 # Optional: non-root user
# ENV MYSQL_PASSWORD=mypassword         # Optional: password for non-root user

# Copy the custom MariaDB configuration if needed (Optional)
# COPY my-mariadb.cnf /etc/mysql/mariadb.conf.d/

# Expose the default MariaDB port
# EXPOSE 3306

# Add a startup script to initialize the database and run MariaDB
# COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
# ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Default command to start MariaDB
# CMD ["mysqld_safe"]
