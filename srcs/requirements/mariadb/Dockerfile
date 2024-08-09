FROM debian:bullseye

# when trying to run mysqld_safe it says mysql already running
ARG DB_ROOT_PASS 

RUN apt update -y --no-install-recommends \
&& apt install -y --no-install-recommends mariadb-server mariadb-client

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# # copy bash script for mysql and make it executable
COPY tools/setup_db.sh /
RUN chmod +x /setup_db.sh

# #change ownership of files to ensure db server has the right permissions
RUN chown -R mysql:mysql /var/lib/mysql/

RUN sed -i 's|socket = /run/mysqld/mysqld.sock|socket = /var/run/mysqld/mysqld.sock|' /etc/mysql/my.cnf

RUN service mariadb restart 

# RUN echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny\n" | mysql_secure_installation

RUN touch /var/run/mysqld/mysqld.sock 
# # #change permissions for socket
RUN chmod -R 777 /var/run/mysqld/*
RUN chmod 777 /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld/*

RUN /setup_db.sh

RUN service mariadb restart 
# do we need to restart?
# # RUN mariadb -e --socket=/var/run/mysqld/mysqld.sock"CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
# #                 CREATE USER 'jebucoy'@'' IDENTIFIED BY '123'; \
# #                 GRANT ALL PRIVILEGES ON wordpress.* TO 'jebucoy'@''; \
# #                 ALTER USER 'root'@'localhost' IDENTIFIED BY '123'; \
# #                 FLUSH PRIVILEGES;"

#or restart after copying conf file

ENTRYPOINT ["mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf"]

# ENTRYPOINT [ "/bin/bash" ]

