# Step 1: Use Debian as the base image
FROM debian:bullseye

# Step 2: Update and install Nginx + open ssl
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx openssl
RUN rm -rf /var/lib/apt/lists/*

# Step 3: Copy your custom Nginx configuration (optional)
COPY conf/default.conf /etc/nginx/conf.d/inception.conf

# Step 4: Create a SSL/TLS connection
RUN apt-get -y install openssl
RUN mkdir -p /etc/nginx/ssl	

RUN openssl req -x509 -nodes \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=mbriand.42.fr/UID=mbriand"

# Step 6: Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

# Step 4: Modify permissions
# RUN mkdir -p /var/www/wordpress
# RUN chmod 755 /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/wordpress

# RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf
# RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
# COPY ./conf/ssl-params.conf /etc/nginx/snippets/

# Create a directory to store nginx configuration
# RUN mkdir -p /var/run/nginx
