FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget

RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysqli mariadb-client curl iputils-ping

# Install wordpress ?
# RUN wget https://wordpress.org/wordpress-6.6.2.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.6.2.tar.gz && rm wordpress-6.6.2.tar.gz

RUN mkdir -p /run/php 
RUN chown -R www-data:www-data /run/php

RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Script wordpress
COPY /conf/wp-config.sh  .
RUN chmod +x wp-config.sh
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# ENTRYPOINT ["./wp-config.sh"]

# volumes
# RUN chown -R root:root /var/www/wordpress
# RUN chmod -R 777 /var/www/wordpress

CMD ["php-fpm7.4", "-F"]
