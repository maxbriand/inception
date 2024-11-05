# Use Debian as the base image for stability and package availability
FROM debian:latest

# Download nginx, curl and openssl (for generate TLS certificates) at runtime
RUN apt update
RUN apt install nginx curl openssl -y

# Remove useless apt
RUN rm -rf /var/lib/apt/lists/*

# Create a folder to store the certificate and the key: 
RUN mkdir RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and private key for TLS 1.2/1.3
# - Change "localhost" to your domain if available
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#    -keyout /etc/nginx/ssl/inception.key \
#    -out /etc/nginx/ssl/inception.crt \
#    -subj "/C=US/ST=State/L=City/O=Organization/OU=Org Unit/CN=localhost"

RUN openssl req -x509 -nodes \ 
	-out /etc/nginx/ssl/inception.crt 
	-keyout /etc/nginx/ssl/inception.key 
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"



# Create a directory to store nginx configuration
RUN mkdir -p /var/run/nginx

# Copy a custom NGINX configuration file into the container to set the configuration of nginx in the server
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Be sure that we have all authorization
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Start NGINX in the foreground to keep the container running
CMD ["nginx", "-g", "daemon off;"]




# Set environment variable to prevent prompts during installation
#ENV DEBIAN_FRONTEND=noninteractive

## Remove the default NGINX configuration
#RUN rm /etc/nginx/sites-enabled/default
#


## Expose port 443 for HTTPS traffic
#EXPOSE 443
#
#