# #Use the lastest debian version
FROM debian:bullseye

# #Update apt
RUN apt upgrade -y
RUN apt update -y
RUN apt install mariadb-server -y

# Remove useless packages
RUN rm -rf /var/lib/apt/lists/*

#update Mariadb serv conf
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i "s/^bind-address\s*=.*$/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

#copy database script in my container AND use the database creation script
COPY tools/script.sh /run/script.sh
RUN chmod +x /run/script.sh

STOPSIGNAL SIGKILL

CMD ["/run/script.sh"]
