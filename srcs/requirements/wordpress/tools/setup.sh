#!/bin/bash

sleep 2

if [ ! -f "/var/www/wordpress/wp-config.php" ]
then

	echo "|=======> Wordpress: Downloading core"

	wp-cli core download --allow-root --path=/var/www/wordpress

	cd /var/www/wordpress
	mkdir -p /var/www/wordpress/log/
	echo "|=======> Wordpress: Creating wp-config.php"
	wp-cli config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$MYSQL_USER_NAME \
		--dbpass=$MYSQL_USER_PASSWORD \
		--dbhost=mariadb:3306 \

	echo "|=======> Wordpress: Installing core"
	wp-cli  core install --allow-root \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--url=$DOMAIN_NAME


	echo "|=======> Wordpress: Add user"
	wp-cli user create --allow-root \
		$WP_USER_NAME \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD

	chown -R www-data:www-data /var/www/wordpress/
	chmod -R 750 /var/www/wordpress/

fi

if [ -f "/var/www/wordpress/wp-config.php" ]
then
	touch /tmp/started
	echo "|=======> Wordpress: Up"
	exec su - www-data -s /bin/bash -c "/usr/sbin/php-fpm81 -F"
else
	echo "|=======> Wordpress: Error"
	rm -f /tmp/started
	exit 1
fi