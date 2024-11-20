FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget

RUN apt-get install -y php7.4 \
	php7.4-fpm\
	php7.4-mysql\
	mariadb-client

RUN wget https://wordpress.org/wordpress-6.6.2.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.6.2.tar.gz && rm wordpress-6.6.2.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN chmod -R 777 /var/www/wordpress

# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
	
CMD ["php-fpm7.4", "-F"]