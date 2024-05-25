#!/bin/bash


### Initialize DB and Wp profile
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	# Start the MariaDB service as daemon
	echo -n "|=======> USING => "
	mariadb --version

	echo "|=======> Starting MariaDB..."
	/etc/init.d/mariadb setup
	rc-service mariadb start

	echo "|=======> Creating DataBase and users..."

	# Create new user and Make The user GRANT ALL PRIVILEGES to all databases in loaclhosts
	mysql -u ${MYSQL_ROOT_USER} -e "CREATE USER '${MYSQL_USER_NAME}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -u ${MYSQL_ROOT_USER} -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER_NAME}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -u ${MYSQL_ROOT_USER} -e "FLUSH PRIVILEGES;"

	# Create new user and Make The user GRANT ALL PRIVILEGES on $DB_NAME database
	mysql -u ${MYSQL_ROOT_USER} -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mysql -u ${MYSQL_ROOT_USER} -e "CREATE USER '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -u ${MYSQL_ROOT_USER} -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -u ${MYSQL_ROOT_USER} -e "FLUSH PRIVILEGES;"

	# Change Password For root user
    mysql -u ${MYSQL_ROOT_USER} -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

	rc-service mariadb restart
	rc-service mariadb stop

	sleep 2 # Wait for the SQL commands to execute
	echo "|=======> Setup Done!"
fi

sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# Stop the MariaDB service if for some reason it is still running
rc-service mariadb stop

sleep 2

### Start in foreground if there was no error

if [ -d "/var/lib/mysql/$DB_NAME" ]; then # If no database was created in the previous step then exit
	echo "|=======> Starting Database $DB_NAME in foreground"
	touch /tmp/healthcheck
	exec /usr/bin/mariadbd-safe --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/run/mysqld/mariadb.pid
else
	echo "|=======> Error: Database not created"
	rm -f /tmp/healthcheck
	exit 1
fi