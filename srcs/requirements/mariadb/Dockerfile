FROM debian:bullseye

# RUN apt update -y --no-install-recommends && apt install mariadb-server -y --no-install-recommends

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


RUN apt update -y --no-install-recommends \
&& apt install -y --no-install-recommends mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup_db.sh /

RUN chown -R mysql:mysql /var/lib/mysql

RUN chmod +x setup_db.sh

RUN service mariadb start

RUN ./setup_db.sh

EXPOSE 3306

CMD ["mysqld_safe"]


