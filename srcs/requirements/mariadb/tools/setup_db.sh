mysql -u root << a
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'jebucoy'@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON wordpress.* TO 'jebucoy'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
a