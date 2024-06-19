FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf



