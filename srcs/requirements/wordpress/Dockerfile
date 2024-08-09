FROM debian:bullseye

# # TO-DO
# - create bash script all you need to do is 
#  1. sudo -u  www-data wp config create
#  2. sudo -u www-data core install
#  3. sudo -u ww-data user create 
# and then run the php-fpm server

RUN apt update -y --no-install-recommends

# installing all dependencies
RUN apt install  -y --no-install-recommends\
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    wget \
    ca-certificates \
    curl \
    sudo

# # copying configuration file into docker
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#install wordpress

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& mkdir -p /var/www/html \
	&& mv wordpress/* /var/www/html/

#install wordpress cli
RUN wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod 777 wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/

EXPOSE 9000

COPY /tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

RUN /setup.sh

ENTRYPOINT "php-fpm7.4 -FR"






