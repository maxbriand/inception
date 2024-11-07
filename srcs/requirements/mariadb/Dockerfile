# Use the lastest debian version
FROM debian:latest

# Update apt
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

#update Mariadb conf
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf








# # The default command to run MariaDB
# CMD ["mysqld"]
