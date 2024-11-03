# Use Debian as the base image for stability and package availability
FROM debian:latest

# Set environment variable to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
# - nginx: web server
# - openssl: for generating TLS certificates
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Create a directory to store SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and private key for TLS 1.2/1.3
# - Change "localhost" to your domain if available
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Org Unit/CN=localhost"

# Remove the default NGINX configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy a custom NGINX configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start NGINX in the foreground to keep the container running
CMD ["nginx", "-g", "daemon off;"]
