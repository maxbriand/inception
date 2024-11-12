# Use Debian as the base image for stability and package availability
FROM debian:bullseye

# Download nginx, curl and openssl (for generate TLS certificates) at runtime
RUN apt update
RUN apt install nginx curl openssl -y

# Remove useless apt
RUN rm -rf /var/lib/apt/lists/*

# Create a folder to store the certificate and the key: 
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and private key for TLS 1.2/1.3
RUN openssl req -x509 -nodes \ 
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=mbriand.42.fr/UID=mbriand"

# Create a directory to store nginx configuration
RUN mkdir -p /var/run/nginx

# Be sure that we have all authorization
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Copy a custom NGINX configuration file into the container to set the configuration of nginx in the server
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Start NGINX in the foreground to keep the container running
CMD ["nginx", "-g", "daemon off;"]
