chmod 777 -R /var/www/html
cd /var/www/html/

wp --allow-root core download --force

mv wp-config-sample.php wp-config.php

sed -i "s/'database_name_here'/'$DB_NAME'/g" wp-config.php
sed -i "s/'username_here'/'$DB_USER'/g" wp-config.php
sed -i "s/'password_here'/'$DB_PASS'/g" wp-config.php
sed -i "s/'localhost'/'mariadb'/g" wp-config.php

wp --allow-root --path=/var/www/html core install \
	--url='jebucoy.42.fr' --title='WordPress' \
	--skip-email --admin_email="${WP_EMAIL}" \
	--admin_user="$WP_USER" \
	--admin_password="$WP_PASS"

wp --allow-root user create $WP_OTHER_USER "${WP_OTHER_MAIL}" --user_pass=$WP_OTHER_PASS --role=editor

chmod -R 777 /var/www/html
