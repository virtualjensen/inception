FROM debian:bullseye

# RUN apt update -y --no-install-recommends && apt install mariadb-server -y --no-install-recommends

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# when trying to run mysqld_safe it says mysql already running

RUN apt update -y --no-install-recommends \
&& apt install -y --no-install-recommends mariadb-server 

COPY conf/my.cnf /etc/my.cnf

# copy bash script for mysql and make it executable
COPY tools/setup_db.sh /
RUN chmod +x setup_db.sh

RUN chown -R mysql:mysql /var/lib/mysql/

RUN service mariadb start 
RUN chown -R mysql:mysql /run/mysqld/
RUN ./setup_db.sh
RUN service mariadb stop 

EXPOSE 3306

COPY conf/my.cnf /etc/my.cnf

CMD ["mysqld", "--defaults-file=/etc/my.cnf"]

# CMD ["/bin/bash/"]

