#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql

mkdir run/openrc
openrc
touch /run/openrc/softlevel
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'password';" | mysql -u root
# echo "SET PASSWORD FOR root@'%'=PASSWORD('password');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

rc-service mariadb restart

while true; do
    sleep 1;
done