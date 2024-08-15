FROM debian:bullseye

ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

RUN apt update --no-install-recommends -y && \
    apt install mariadb-server -y && \
    apt install mariadb-client -y

RUN chown -R mysql:mysql /var/lib/mysql && \ 
    service mariadb restart && \
    echo -e "\ny\ny\n${DB_ROOT_PASS}\n${DB_ROOT_PASS}\ny\ny\ny\ny\n" | mysql_secure_installation && \
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
    CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; \
    GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}'; \
    FLUSH PRIVILEGES;" && \
    service mariadb restart

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]
