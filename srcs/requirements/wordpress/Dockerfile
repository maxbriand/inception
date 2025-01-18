FROM debian:bullseye

# Install dependencies
RUN apt-get -y update \
	&& apt-get -y upgrade

RUN apt-get -y install \
	wget \
	php7.4 \
	php7.4-fpm \
	php7.4-mysqli \
	mariadb-client \
	curl \
	iputils-ping \
	sudo

# Create directories for PHP-FPM
RUN mkdir -p /var/www
RUN mkdir -p /var/www/html

# Configure PHP-FPM
RUN mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php

# Update PHP-FPM configuration to listen on all interfaces
# This change ensures that PHP-FPM is accessible by Nginx or other services
# that may run in separate containers, improving maintainability and scalability.
RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Install WordPress CLI and Configuration
COPY /conf/wp-config.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/wp-config.sh
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp.phar

# Run PHP-FPM
CMD ["wp-config.sh"]
