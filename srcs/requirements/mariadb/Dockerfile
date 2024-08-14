FROM debian:bullseye

ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update --no-install-recommends -y && \
    apt-get install mariadb-server -y && \
    apt-get install mariadb-client -y

RUN chown -R mysql:mysql /var/lib/mysql && \ 
    service mariadb restart && \
    echo -e "\ny\ny\n${DB_ROOT_PASSWORD}\n${DB_ROOT_PASSWORD}\ny\ny\ny\ny\n" | mysql_secure_installation && \
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
    CREATE USER '${DB_USER}'@'' IDENTIFIED BY '${DB_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@''; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; \
    FLUSH PRIVILEGES;" && \
    service mariadb restart

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]
