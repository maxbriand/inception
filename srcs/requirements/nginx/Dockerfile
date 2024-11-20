# # Copy a custom NGINX configuration file into the container to set the configuration of nginx in the server
# # RUN rm -rf /etc/nginx/nginx.conf
# # COPY conf/nginx.conf /etc/nginx/site-available/.

# # # # Create a folder to store the certificate and the key: 
# # RUN mkdir -p /etc/nginx/ssl	

# # # # Generate a self-signed SSL certificate and private key for TLS 1.2/1.3
# # RUN openssl req -x509 -nodes \ 
# # 	-out /etc/nginx/ssl/inception.crt \
# # 	-keyout /etc/nginx/ssl/inception.key \
# # 	-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=mbriand.42.fr/UID=mbriand"

# # # # Create a directory to store nginx configuration
# # RUN mkdir -p /var/run/nginx

# # # # Be sure that we have all authorization
# # RUN chmod 755 /var/www/html
# # RUN chown -R www-data:www-data /var/www/html

# # Step 4: Expose port 80 for HTTP traffic
# EXPOSE 80

# Start NGINX in the foreground to keep the container running
# CMD ["nginx", "-g", "daemon off;"]

# Dockerfile to build an Nginx server based on Debian

# Step 1: Use Debian as the base image
FROM debian:bullseye

# # Download nginx and openssl (for generate TLS certificates) at runtime
# Step 2: Update and install Nginx
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx openssl -y
RUN rm -rf /var/lib/apt/lists/*
# apt-get clean

# Step 3: Copy your custom Nginx configuration (optional)
COPY conf/default.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# Step 5: Ensure Nginx listens on all network interfaces
# RUN echo 'server { listen 0.0.0.0:80; }' > /etc/nginx/conf.d/default.conf

# Step 6: Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

