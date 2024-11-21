# Step 1: Use Debian as the base image
FROM debian:bullseye

# Step 2: Update and install Nginx + open ssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx openssl -y
RUN rm -rf /var/lib/apt/lists/*
# apt-get clean

# Step 3: Copy your custom Nginx configuration (optional)
COPY conf/default.conf /etc/nginx/nginx.conf

# Step 4: Modify permissions
RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# Step 5: Create a SSL/TLS connection
RUN mkdir -p /etc/nginx/ssl	

# Generate a self-signed SSL certificate and private key for TLS 1.2/1.3
# RUN openssl req -x509 -nodes \ 
# 	-out /etc/nginx/ssl/inception.crt \
# 	-keyout /etc/nginx/ssl/inception.key \
# 	-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=mbriand.42.fr/UID=mbriand"

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
			-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=mbriand.42.fr/UID=mbriand"
RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf
RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
COPY ./conf/ssl-params.conf /etc/nginx/snippets/

# # # # Create a directory to store nginx configuration
# # RUN mkdir -p /var/run/nginx

# Step 6: Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
