FROM debian:bullseye

RUN apt update
RUN apt install nginx openssl -y --no-install-recommends


RUN rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*
COPY ["./conf/my_nginx.conf", "/etc/nginx/nginx.conf"]

COPY ["./tools/index.html", "/var/www/html/."]
#generates self-signed ssl certificate and private key and stores in respective /etc/ directory
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 3650 -nodes -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=42/OU=Abu Dhabi/CN=${INTRA_LOGIN}"


#runs nginx
ENTRYPOINT usr/sbin/nginx -g "daemon off;"

#copies the config file and puts it in the /etc/ respective file
# apt-get update (needed before installing nginx)
# apt-get upgrade
# apt-get install nginx -y (to override prompts to yes)

# docker build -t nginx ./ 

# docker run -it nginx 

# docker exec -it *contained ID* /bin/bash