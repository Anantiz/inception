#!bin/bash

mkdir -p /etc/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/certs/vsftpd.key \
	-out /etc/certs/vsftpd.crt \
	-subj ${OPEN_SSL_SUBJ} 2> /dev/null

mkdir -p /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
chown -R www-data:www-data /etc/vsftpd
chown -R www-data:www-data /etc/certs

echo "|=======> FTP: Starting"

exec vsftpd /etc/vsftpd/vsftpd.conf