FROM debian:bullseye

RUN apt-get update

RUN apt-get update -y --no-install-recommends && apt-get install mariadb-server -y --no-install-recommends

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
