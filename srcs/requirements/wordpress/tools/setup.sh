#!/bin/bash

chmod 755 -R /var/www/html

wp core download

sudo -u www-data wp config create --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASS \
    --dbhost=$DB_HOST \
    --dbprefix=$DB_PRE \
    --allow-root

sudo -u www-data wp core install --url=$DOMAIN_NAME \
    --title="$WP_TITLE" \
    --admin_user=$WP_USER \
    --admin_password=$WP_PASS \
    --admin_email=$WP_EMAIL \
    --allow-root

sudo -u www-data wp user create "$WP_OTHER_USER" $WP_OTHER_EMAIL \
    --user_pass=$WP_OTHER_PASS \
    --role=author \
    --allow-root







