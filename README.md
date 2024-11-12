# inception
docker 42 project

- What's the goal of the project?
Create a fully containerized Wordpress website.

- What should be the composition of this website?
This website is composed of 3 parts:
1) NGINX.
2) Wordpress.
3) MariaDB.

- What's the purpose of NGINX?
NGINX is the server (or gateway) that allow access to the website application. It handles secute during the connection and ?routing users">.

- What's the purpose of WordPress container?
Handle the website presentation that user see, charging informations from the database.

- What's the purpose of MariaDB container?
Wordpress is the part, the databse where website data and content are actually stored.

- Is it possible to create the website without use containerization tools (like Docker)?
Yes, it's possible to create this website without use Docker. We could manually install and configurate NGINX, Wordpress and MariaDB on a server.

- Are some popular modern website not using a containerization tool?
Yes, according industries, some modern website aren't build using docker-like tools. Sometimes for security policy or for simple website for example.

- So, why should we use docker?
Yes, because it's easier for deployment, isolation using containerization and management. Basically, it's to earn time.

- What's basically the structure to create a website using docker?
At least, one docker-compose + one dockerfile for each container.

Example: 
project-root/
├── docker-compose.yml      
├── .env                     
└── src/
    ├── nginx/
    │   ├── Dockerfile       
    │   └── nginx.conf      
    ├── wordpress/
    │   ├── Dockerfile       
    │   └── wp-config.php    
    └── mariadb/
        ├── Dockerfile       
        └── init.sql

- What's the good process? Starting creating docker file and docker compose OR installing nginx...?
???It's recommended to test application locally first???

- How can I configurate the NGINX container?
1) Create the dockerfile
2) Create the image of this container

# First point (part 1): Create the DOCKERFILE
- How can I start to set the server using the nginx dockerfile?
The first line of dockerfiles is ALWAYS the FROM line.

- What's the purpose of the from line?
To start with a base container.
The FROM line can for example include:
OS: ubuntu, debian or alpine
Programming language: python, node
Database: mysql, mariadb
Webserver: nginx (for Inception, we cannot use this image)

- What's the structure of this first line?
FROM <image_name>:<tag>
FROM ubuntu:20.04        # Ubuntu 20.04 as base OS
FROM debian:latest       # Latest Debian version

# Second point: Image management
- What's a container image ?
It's a template that defined everything needed to run an application consistently.
When executed the image become a container (and several containers launch in the same time basically create the website).

- How can I avoid to type sudo when I use docker command?
??

- How can we generate an image?
To generate the container image we can use the command: "docker build ." in the the container folder.
-t option enable to name the image generated.
Example:
docker build -t <image_name>:<tag> .

- How can I solve this error I got when I am aiming to the image: ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var
/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied?
That's a common error when a dockerfile is not correctly set and we launch the dockerfile.

- How can we check if the image is correctly generated?
The command: "docker images", provide a list of our docker images.

- How can I launch/use the image?
Command in the directory: 
	docker run "image_name"

- How can I run it using the terminal of the server (nginx)?
Add -it option: 
	docker run -it "image_name"

- How can we delete an image?
Command: docker rmi "image_name" -> doesnt work correctly

# First point (part 2)

- When I start to configure my server, the configuration is not save, how can I launch my server with a specific configuration?
We can create a RUN line in the dockerfile.
This line enable launching a command at the run time, like downloading nginx.

- What's the actual structure of the RUN line?
RUN <command>
Examples:
RUN apt install nginx
RUN apt install nginx -y (it's an apt option to answer yes when apt is asking some questions)

- We can launch a server with nginx now. Should we need to add other elements in the dockerfile?
The connection is not secure. We should use a TLS system.

- Why the connection is not secure?
Cause the client send datas to nginx with plain text. The text has to be crypted before arrive in nginx.

- How can I setup TLS crypting in the dockerfile?
1) Download TLS certificate generator at runtime: install open
2) Create a folder to store the certificate and the key: mkdir RUN mkdir -p /etc/nginx/ssl
3) Create an tls/ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/nginx/ssl/nginx.key \
   -out /etc/nginx/ssl/nginx.crt \
   -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" // CN can varied ?? + UID is useless?

- What's else?
Create a folder to store configurations files of NGINX
Command: mkdir -p /var/run/nginx

- Then?
COPY conf/nginx.conf /etc/nginx/nginx.conf




# MariaDB Part

- What's the purpose of MariaDB?
Store the application web datas.

- How can we basically use MariaDB?
We can use MariaDB from its shell.
This is the command to launch the MariaDB shell:
1) service mariadb start
2) mysql -u root -p

- What's the exact purpose of this second command?
mysql: open the command line mariadb system.
-u root: use the root username
-p: prompt for a password

- Which basics commands can I type on mariaDB shell?
	1) SHOW DATABASES: display database list
	2) CREATE DATABASE "database_name": create database
	3) DROP DATABASE "database_name": delete database
	4) USE "database_name": select a specific database
	5) SHOW TABLES: display tables of the selected database
To execute the command I have to add a semi colon at the end: ";"

- 
















// Docker part

- What's the purpose of a docker-compose.yml?
It's to orchestrate the connection between multiple containers, networks and volumes in a single file, to make them work together as a single application.

- What's the structure of a docker-compose file?



- What's the purpose of a Dockerfile?
Script-like text that contains instructions for generate a Docker image.

Example:
FROM python:3.8
COPY app.py /app/app.py
WORKDIR /app
RUN pip install flask
CMD ["python", "app.py"]

- What's a docker image?

