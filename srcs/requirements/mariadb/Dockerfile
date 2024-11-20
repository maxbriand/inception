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

# Copy the custom MariaDB configuration if needed (Optional)
# COPY my-mariadb.cnf /etc/mysql/mariadb.conf.d/

# Add a startup script to initialize the database and run MariaDB
# COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
# ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Default command to start MariaDB
# CMD ["mysqld_safe"]
