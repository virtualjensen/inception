FROM debian:bullseye

# # TO-DO
# - create bash script all you need to do is 
#  1. sudo -u  www-data wp config create
#  2. sudo -u www-data core install
#  3. sudo -u ww-data user create 
# and then run the php-fpm server
ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_PRE
ARG DOMAIN_NAME
ARG WP_TITLE
ARG WP_USER
ARG WP_PASS
ARG WP_EMAIL
ARG WP_OTHER_USER
ARG WP_OTHER_EMAIL
ARG WP_OTHER_PASS

RUN apt update -y --no-install-recommends

# installing all dependencies
RUN apt install  -y --no-install-recommends\
    php-fpm \
    php-mysql \
    mariadb-client \
    wget \
    ca-certificates \
    curl \
    sudo

# copying configuration file into docker
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

RUN chmod -R 777 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.4/fpm/php.ini
RUN sed -i "s/;date.timezone =/date.timezone = Asia\/Dubai/" /etc/php/7.4/fpm/php.ini

RUN mkdir -p /run/php/

WORKDIR /var/www/html

COPY /tools/setup.sh /var/www/html

RUN chmod +x /var/www/html/setup.sh

# RUN /setup.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/html/setup.sh"]

# ENTRYPOINT ["bash"]